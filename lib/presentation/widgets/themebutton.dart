import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const ThemeButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: SizedBox(
        height: 55,
        width: MediaQuery.of(context).size.width - 45,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF0BA37F)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    30.0), // Set the desired border radius here
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AHref extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const AHref({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
          style: const TextStyle(
            color: Color(0xFF0BA37F),
          ),
          text),
    );
  }
}
