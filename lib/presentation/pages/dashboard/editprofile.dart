import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/profileproviders.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProfile extends ConsumerStatefulWidget {
  final String userId;
  const UpdateProfile(this.userId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends ConsumerState<UpdateProfile> {
  late UserModel user;
  late AuthState userstate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    user = UserModel();
    userstate = const AuthState();
    // Initialize the variable in initState
  }

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
    ref.listen(profileProvider, (prev, next) {
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
        Future.delayed(const Duration(milliseconds: 100), () {
      final userscalled = ref
          .read(profileProvider.notifier)
          .perfromGetUserProfileRequest(widget.userId);
      return userscalled;
    });

    // final UserState checkState = ref.watch(adminUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
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
          child: FutureBuilder<AuthState>(
            future: usersfuturesingle,
            builder: (BuildContext context, AsyncSnapshot<AuthState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final checkState = snapshot.data;
                final fulldata = snapshot.data?.data['data'];
                // debugPrint(fulldata['name'].toString());
                // debugPrint(fulldata.toString());
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputField(
                        initialValue: fulldata['username'].toString(),
                        // controller: TextEditingController(
                        //   text: fulldata['username'].toString(),
                        // ),
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
                        initialValue: fulldata['name'].toString(),
                        // controller: TextEditingController(
                        //   text: fulldata['name'].toString(),
                        // ),
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
                        initialValue: fulldata['email'].toString(),
                        // controller: TextEditingController(
                        //   text: fulldata['email'].toString(),
                        // ),
                        hintText: " Enter your email",
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          }
                          if (!validateEmail(value)) {
                            return 'Enter valid email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          user = user.copyWith(email: value!);
                          user = user.copyWith(id: widget.userId.toString());
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
                                .read(profileProvider.notifier)
                                .perfromUpdateProfileRequest(
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
                              .read(profileProvider.notifier)
                              .perfromGetUserProfileRequest(widget.userId);

                          await ref
                              .read(loginProvider.notifier)
                              .performgetUser(widget.userId);
                        },
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Scaffold(
                  body: Center(
                    child: CupertinoActivityIndicator(
                      radius: 50,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
