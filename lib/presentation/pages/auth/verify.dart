import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  late UserModel user;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
            height: 500,
            child: Form(
              key: _formKey,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputField(
                    hintText: " Enter your email",
                  ),
                  InputField(
                    hintText: " Enter your password",
                  ),
                  ThemeButton(
                    text: 'Create Account',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
