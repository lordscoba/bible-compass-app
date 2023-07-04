import 'dart:async';

import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/presentation/pages/admin/categories/category.dart';
import 'package:bible_compass_app/presentation/pages/admin/home.dart';
import 'package:bible_compass_app/presentation/pages/admin/keywords/keyword.dart';
import 'package:bible_compass_app/presentation/pages/admin/subscription/subscription.dart';
import 'package:bible_compass_app/presentation/pages/admin/users/users.dart';
import 'package:bible_compass_app/presentation/pages/admin/verses/verse.dart';
import 'package:bible_compass_app/presentation/pages/auth/login.dart';
import 'package:bible_compass_app/presentation/pages/auth/signup.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/category.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/favorite.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/keywords.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/profile.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/sub.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/userverse.dart';
import 'package:bible_compass_app/presentation/pages/error.dart';
import 'package:bible_compass_app/presentation/pages/splash.dart';
import 'package:bible_compass_app/utils/checkauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:google_fonts/google_fonts.dart';

import '../presentation/pages/dashboard/home.dart';

class MyRouter extends ConsumerWidget {
  const MyRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FutureOr<String?> redirect1(
        BuildContext context, GoRouterState state) async {
      final prefs = await ref.watch(sharedPrefProvider);
      // get token
      final bool status = prefs.getBool('status') ?? false;
      if (status == false) {
        return '/login';
      } else {
        UserModel user = UserModel();
        checkAuth(ref, user);
        return null;
      }
    }

    // GoRouter configuration
    final router = GoRouter(
      initialLocation: '/home',
      errorBuilder: (context, state) => const ErrorScreen(),
      // initialLocation: '/signup',
      routes: [
        // splash screen
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),

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
          redirect: redirect1,
        ),
        GoRoute(
          path: '/category',
          builder: (context, state) => const CategoryPage(),
          redirect: redirect1,
        ),
        GoRoute(
          path: '/keywords/:catid',
          builder: (context, state) {
            final catid = state.pathParameters['catid'];
            return KeywordPage(
              catId: catid!,
            );
          },
          redirect: redirect1,
        ),
        GoRoute(
          path: '/verse/:keywid',
          builder: (context, state) {
            final keywid = state.pathParameters['keywid'];
            return UserVersePage(
              keywId: keywid!,
            );
          },
          redirect: redirect1,
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
          redirect: redirect1,
        ),
        GoRoute(
          path: '/sub',
          builder: (context, state) => const SubPage(),
          redirect: redirect1,
        ),
        GoRoute(
          path: '/favorite',
          builder: (context, state) => const FavouritePage(),
          redirect: redirect1,
        ),

        // admin screen
        GoRoute(
          path: '/admin',
          builder: (context, state) => const AdminHome(),
          redirect: redirect1,
        ),
        GoRoute(
          path: '/admin/users',
          builder: (context, state) => const AdminUsers(),
          redirect: redirect1,
        ),
        GoRoute(
          path: '/admin/categories',
          builder: (context, state) => const AdminCategory(),
          redirect: redirect1,
        ),
        GoRoute(
          path: '/admin/keywords/:catid',
          builder: (context, state) {
            final catid = state.pathParameters['catid'];
            return AdminKeyword(catId: catid);
          },
          redirect: redirect1,
        ),
        GoRoute(
          path: '/admin/subscription',
          builder: (context, state) => const AdminSubscription(),
          redirect: redirect1,
        ),
        GoRoute(
          path: '/admin/verses/:keywid',
          builder: (context, state) {
            final keywid = state.pathParameters['keywid'];
            return AdminVerses(
              keywid: keywid,
            );
          },
          redirect: redirect1,
        ),
      ],
    );

    return MaterialApp.router(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
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
