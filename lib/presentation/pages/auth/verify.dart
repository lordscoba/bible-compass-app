import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/presentation/widgets/snacksbar.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:bible_compass_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/user/user.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/themebutton.dart';

class VerifyUserScreen extends ConsumerStatefulWidget {
  const VerifyUserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyUserScreenState();
}

class _VerifyUserScreenState extends ConsumerState<VerifyUserScreen> {
  late VerifyModel user;
  late UserState userstate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    user = VerifyModel();
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
    // final AuthState checkState = ref.watch(loginProvider);

    ref.listen(verifyProvider, (prev, next) {
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
        leading: IconButton(
          onPressed: () {
            context.push("/home");
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text("Account Forgot Password"),
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
                    hintText: "Enter your email",
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
                  ThemeButton(
                    text: 'Submit',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        // debugPrint(user.toJson().toString());
                        await ref
                            .read(verifyProvider.notifier)
                            .perfromVerifyUserRequest(
                              user.toJson(),
                            );
                        message();
                        if (ref.watch(errorMessageProvider) == "") {
                          Future.delayed(const Duration(seconds: 10), () {
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
                      const Text("Already Verified?"),
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
