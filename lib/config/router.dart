import 'package:bible_compass_app/presentation/pages/admin/category.dart';
import 'package:bible_compass_app/presentation/pages/admin/home.dart';
import 'package:bible_compass_app/presentation/pages/auth/login.dart';
import 'package:bible_compass_app/presentation/pages/auth/signup.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/category.dart';
import 'package:bible_compass_app/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pages/dashboard/home.dart';

class MyRouter extends ConsumerWidget {
  const MyRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // GoRouter configuration
    final router = GoRouter(
      initialLocation: '/admin',
      routes: [
        // splash screen
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        // GoRoute(
        //   path: '/test',
        //   builder: (context, state) => const Test(),
        // ),

        // Auth screen
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),

        // dashboard screen
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/category',
          builder: (context, state) => CategoryPage(),
        ),

        // admin screen
        GoRoute(
          path: '/admin',
          builder: (context, state) => const AdminHome(),
        ),
        GoRoute(
          path: '/admin/category',
          builder: (context, state) => const AdminCategory(),
        ),
      ],
    );

    return MaterialApp.router(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0BA37F),
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.white, // Set the color of the menu icon
            size: 28, // Set the size of the menu icon
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
