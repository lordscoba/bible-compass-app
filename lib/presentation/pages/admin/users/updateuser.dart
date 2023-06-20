import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/adminusersproviders.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateUsers extends ConsumerStatefulWidget {
  final String userId;
  const UpdateUsers(this.userId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateUsersState();
}

class _UpdateUsersState extends ConsumerState<UpdateUsers> {
  late UserModel user;
  late UserState userstate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    user = UserModel();
    userstate = const UserState();
    // Initialize the variable in initState
  }

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'true',
      'label': 'True',
    },
    {
      'value': 'false',
      'label': 'False',
    },
  ];
  final List<Map<String, dynamic>> _itemsuser = [
    {
      'value': 'user',
      'label': 'User',
    },
    {
      'value': 'admin',
      'label': 'Admin',
    },
  ];

  void message() {
    final String message;
    final bool error;
    final sucessmessage = ref.watch(successMessageProvider);
    final errormessage = ref.watch(errorMessageProvider);
    if (errormessage.isEmpty) {
      message = sucessmessage;
      error = false;
    } else {
      message = errormessage;
      error = true;
    }
    var displaymessage = SnackBarClass();
    // ignore: use_build_context_synchronously
    displaymessage.snackBarMade(context, message, error);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(adminUserProvider, (prev, next) {
      if (next.error.isNotEmpty) {
        ref.read(errorMessageProvider.notifier).state = next.error.toString();
        // debugPrint(next.error);
      }
      if (!next.data['message'].toString().contains("null")) {
        ref.read(successMessageProvider.notifier).state =
            next.data['message'].toString();
        // debugPrint(next.data['message'].toString());
      }
    });

    final dynamic usersfuturesingle =
        Future.delayed(const Duration(seconds: 2), () {
      final userscalled = ref
          .read(adminUserProvider.notifier)
          .perfromGetSingleUserRequest(widget.userId);
      return userscalled;
    });

    // final UserState checkState = ref.watch(adminUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0xFFE2E2E2),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<UserState>(
            future: usersfuturesingle,
            builder: (BuildContext context, AsyncSnapshot<UserState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final checkState = snapshot.data;
                final fulldata = snapshot.data?.data['data'];
                // debugPrint(fulldata['name'].toString());
                debugPrint(fulldata.toString());
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputField(
                        controller: TextEditingController(
                          text: fulldata['username'].toString(),
                        ),
                        hintText: " Enter username",
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          user = user.copyWith(username: value!);
                        },
                      ),
                      InputField(
                        controller: TextEditingController(
                          text: fulldata['name'].toString(),
                        ),
                        hintText: " Enter name",
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          user = user.copyWith(name: value!);
                        },
                      ),
                      InputField(
                        controller: TextEditingController(
                          text: fulldata['email'].toString(),
                        ),
                        hintText: " Enter your email",
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          user = user.copyWith(email: value!);
                        },
                      ),
                      SelectField(
                        items: _items,
                        label: 'Is Verified',
                        initialValue: fulldata['is_verified'].toString(),
                        onSaved: (value) {
                          user = user.copyWith(
                              isVerified: value?.toLowerCase() == 'true');
                        },
                      ),
                      SelectField(
                        items: _itemsuser,
                        label: 'User Type',
                        initialValue: fulldata['type'].toString(),
                        onSaved: (value) {
                          user = user.copyWith(type: value.toString());
                        },
                      ),
                      InputField(
                        obscureText: true,
                        hintText: " Enter your password",
                        onSaved: (value) {
                          user = user.copyWith(password: value!);
                        },
                      ),
                      ThemeButton(
                        text: checkState!.isLoading ? "loading..." : 'Update',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            await ref
                                .read(adminUserProvider.notifier)
                                .perfromUpdateUserRequest(
                                    user.toJson(), widget.userId);
                          }
                          // debugPrint(user.toJson().toString());

                          message();
                          if (ref.watch(errorMessageProvider) == "") {
                            Future.delayed(const Duration(seconds: 5), () {
                              // context.go('/admin/users');
                              Navigator.of(context).pop();
                            });
                          }
                          await ref
                              .read(adminUserProvider.notifier)
                              .perfromGetSingleUserRequest(widget.userId);
                        },
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ),
      ),
    );
  }
}
