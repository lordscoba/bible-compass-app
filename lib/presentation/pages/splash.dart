import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/providers/authproviders.dart';
import '../../utils/checkauth.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late UserModel user;
  late AuthState userstate;

  @override
  void initState() {
    super.initState();
    user = UserModel();
    userstate = const AuthState();
    // Initialize the variable in initState
  }

  final Uri _url = Uri.parse('https://snappy-fix.com');
  Future<void> _launchUrl() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // checking authentication
    checkAuth(ref, user, userstate);
    final bool isProjectAuthenticated = ref.watch(isAuthenticated);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bible Compass Overview"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              // image: AssetImage("assets/images/wallpaper1.jpeg"),
              image: AssetImage("assets/images/snow.jpg"),
              fit: BoxFit.cover),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            const SizedBox(
              height: 25,
            ),
            const Center(
              child: Image(
                width: 300,
                image: AssetImage("assets/images/compass-top.png"),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
              width: 300,
              child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.65),
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                  "Bible Compass was built for your benefit in studying the bible and having in-depth knowledge of bible verses relating to different aspects of our life"),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0BA37F),
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 48.0),
                  shadowColor: Colors.grey[800],
                  elevation: 6),
              onPressed: () {
                isProjectAuthenticated
                    ? {
                        Future.delayed(const Duration(milliseconds: 800), () {
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
                      }
                    : {context.push('/home')};
              },
              // onPressed: () {
              //   checkAuth(ref, user, userstate);
              //   context.push('/home');
              //   // debugPrint(isProjectAuthenticated(ref).toString());
              // },
              child: const Text("Get Started"),
            ),
            const SizedBox(
              height: 40,
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
