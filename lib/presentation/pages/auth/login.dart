import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/user/user.dart';
import '../../widgets/inputfield.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
    final AuthState checkState = ref.watch(loginProvider);

    ref.listen(loginProvider, (prev, next) {
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
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/wallpaper1.jpeg"),
              fit: BoxFit.cover),
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
                  ThemeButton(
                    text: checkState.isLoading ? "loading..." : 'Login',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        await ref
                            .read(loginProvider.notifier)
                            .performLogin(user.toJson());
                      }
                      // debugPrint(user.toJson().toString());
                      message();

                      if (ref.watch(errorMessageProvider) == "") {
                        Future.delayed(const Duration(seconds: 3), () {
                          if (ref
                                  .watch(loginProvider)
                                  .data['data']['type']
                                  .toString() ==
                              "admin") {
                            context.go('/admin');
                          } else {
                            context.go('/home');
                          }
                        });
                      }
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You don't have an account?"),
                      AHref(
                        text: 'Sign up',
                        onPressed: () {
                          context.go("/signup");
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
