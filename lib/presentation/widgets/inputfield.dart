import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validation;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? readOnly;
  const InputField({
    super.key,
    required this.hintText,
    this.validation,
    this.onSaved,
    this.controller,
    this.obscureText,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: TextFormField(
        readOnly: readOnly ?? false,
        obscureText: obscureText ?? false,
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

class SelectField extends StatelessWidget {
  final String label;
  final void Function(String?)? onSaved;
  final String initialValue;
  final List<Map<String, dynamic>> items;
  const SelectField({
    super.key,
    this.onSaved,
    required this.label,
    required this.initialValue,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: SelectFormField(
        hintText: 'Is Verfied?',
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
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
        type: SelectFormFieldType.dropdown, // or can be dialog
        initialValue: initialValue,
        labelText: 'Shape',
        items: items,
        onSaved: onSaved,
      ),
    );
  }
}

class TextArea extends StatelessWidget {
  final String hintText;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final int? maxLines;
  const TextArea({
    super.key,
    required this.hintText,
    this.onSaved,
    this.controller,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: TextField(
        maxLines: maxLines,
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
        onChanged: onSaved,
        controller: controller,
      ),
    );
  }
}

class SearchInputField extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchInputField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          hintText: "Enter search text",
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
        onChanged: onChanged,
      ),
    );
  }
}
