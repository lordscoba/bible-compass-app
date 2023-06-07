import 'package:bible_compass_app/presentation/pages/auth/login.dart';
import 'package:bible_compass_app/presentation/pages/auth/signup.dart';
import 'package:bible_compass_app/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyRouter extends ConsumerWidget {
  const MyRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // GoRouter configuration
    final router = GoRouter(
      initialLocation: '/signup',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
