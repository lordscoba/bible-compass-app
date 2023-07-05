// import 'dart:js_interop';

import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/utils/checkauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  void hi() {}

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late UserModel user;
  // late UserState userstate;

  @override
  void initState() {
    super.initState();
    user = UserModel();
    // userstate = const UserState();
    // Initialize the variable in initState
  }

  final Uri _url = Uri.parse('https://snappy-fix.com');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    checkAuth(ref, user);

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
                ref.watch(isAuthenticated)
                    ? Future.delayed(const Duration(milliseconds: 300), () {
                        if (ref
                                .watch(loginProvider)
                                .data['data']['type']
                                .toString() ==
                            "admin") {
                          context.push('/admin');
                        } else {
                          context.push('/home');
                        }
                      })
                    : context.go("/login");
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
