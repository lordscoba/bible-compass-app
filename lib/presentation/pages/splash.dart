import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Uri _url = Uri.parse('https://snappy-fix.com');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/wallpaper1.jpeg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            const Center(
              child: Image(
                width: 300,
                image: AssetImage("assets/images/compass-top.png"),
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0BA37F),
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 48.0),
                  shadowColor: Colors.grey[800],
                  elevation: 6),
              onPressed: () {
                context.go("/login");
              },
              child: const Text("Get Started"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: _launchUrl,
              child: const Text(
                "Powered By Snappy-Fix Tech",
                style: TextStyle(
                  color: Color(0xFF0BA37F),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
