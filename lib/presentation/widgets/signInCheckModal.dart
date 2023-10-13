import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInCheckModal extends ConsumerWidget {
  const SignInCheckModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: 400,
        height: 300,
        decoration: BoxDecoration(
          color: const Color(0xFFE2E2E2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Login Info",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Text(
                "You are not Logged in and Subscribed , press \"Continue\" to log in and subscribe \n \n You can press \"close \" to continue using this page",
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0BA37F),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0BA37F),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30.0),
                  ),
                  onPressed: () {
                    context.push('/login');
                  },
                  child: const Text("Continue"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
