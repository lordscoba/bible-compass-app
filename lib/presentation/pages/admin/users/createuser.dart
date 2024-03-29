import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/adminusersproviders.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateUsers extends ConsumerStatefulWidget {
  const CreateUsers({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateUsersState();
}

class _CreateUsersState extends ConsumerState<CreateUsers> {
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
    final UserState checkState = ref.watch(adminUserProvider);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Users'),
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
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
                  },
                ),
                InputField(
                  obscureText: true,
                  hintText: " Enter your password",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter something';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    user = user.copyWith(password: value!);
                  },
                ),
                InputField(
                  obscureText: true,
                  hintText: " Enter your confirm password",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter something';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    user = user.copyWith(confirmPassword: value!);
                  },
                ),
                ThemeButton(
                  text: checkState.isLoading ? "loading..." : 'Create',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      await ref
                          .read(adminUserProvider.notifier)
                          .perfromCreateUserRequest(user.toJson());

                      // debugPrint(user.toJson().toString());
                      message();
                      if (ref.watch(errorMessageProvider) == "") {
                        Future.delayed(const Duration(seconds: 5), () {
                          Navigator.of(context).pop();
                        });
                      }

                      await ref
                          .refresh(adminUserProvider.notifier)
                          .perfromGetUsersRequest();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
