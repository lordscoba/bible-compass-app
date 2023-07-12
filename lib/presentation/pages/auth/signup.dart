import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:bible_compass_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/user/user.dart';
import '../../widgets/inputfield.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
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
    final UserState checkState = ref.watch(signUpProvider);

    ref.listen(signUpProvider, (prev, next) {
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey.shade200
            // image: DecorationImage(
            //     image: AssetImage("assets/images/wallpaper1.jpeg"),
            //     fit: BoxFit.cover),
            ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CompassTop(
                    width: 200,
                  ),
                  InputField(
                    hintText: " Enter your username",
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      user = user.copyWith(username: value!.trim());
                    },
                  ),
                  InputField(
                    hintText: " Enter your email",
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      if (!validateEmail(value.trim())) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      user = user.copyWith(email: value!.trim());
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
                      user = user.copyWith(password: value!.trim());
                    },
                  ),
                  InputField(
                    obscureText: true,
                    hintText: " Enter your Confirm password",
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      user = user.copyWith(confirmPassword: value!.trim());
                    },
                  ),
                  ThemeButton(
                    text:
                        checkState.isLoading ? "loading..." : 'Create Account',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        await ref
                            .read(signUpProvider.notifier)
                            .perfromSignupRequest(
                              user.toJson(),
                            );

                        // debugPrint(user.toJson().toString());
                        message();
                        if (ref.watch(errorMessageProvider) == "") {
                          Future.delayed(const Duration(seconds: 5), () {
                            context.go("/login");
                          });
                        }
                      }
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Signed Up?"),
                      AHref(
                        text: 'Login up',
                        onPressed: () {
                          context.go("/login");
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
