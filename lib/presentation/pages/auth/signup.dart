import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:bible_compass_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/models/user/user.dart';
import '../../widgets/inputfield.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  bool _isChecked = false;
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

  final Uri _urlPrivacyPolicy =
      Uri.parse('https://www.bible-compass.com/privacy');

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
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
      appBar: AppBar(
        title: const Text("Account Sign Up"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey.shade200),
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
                      user =
                          user.copyWith(username: value!.trim().toLowerCase());
                    },
                  ),
                  InputField(
                    hintText: " Enter your email",
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter something';
                      }
                      if (!validateEmail(value.trim().toLowerCase())) {
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          await _launchUrl(_urlPrivacyPolicy);
                        },
                        child: const Text(
                          "Agree to Our Terms and Conditions",
                          style: TextStyle(
                            color: Color(0xFF0BA37F),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ThemeButton(
                    text:
                        checkState.isLoading ? "loading..." : 'Create Account',
                    onPressed: () async {
                      if (_formKey.currentState!.validate() && _isChecked) {
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
