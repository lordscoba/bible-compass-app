import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validation;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  const InputField({
    super.key,
    required this.hintText,
    this.validation,
    this.onSaved,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black54,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFFFFFFF),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black38,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: validation,
        onSaved: onSaved,
        controller: controller,
      ),
    );
  }
}
