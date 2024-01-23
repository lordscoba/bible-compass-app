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
import 'package:bible_compass_app/presentation/pages/auth/verify.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/bible.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/category.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/faq.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/favorite.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/keywords.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/profile.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/sub.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/userverse.dart';
import 'package:bible_compass_app/presentation/pages/error.dart';
import 'package:bible_compass_app/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../presentation/pages/dashboard/home.dart';
import '../utils/checkauth.dart';

class MyRouter extends ConsumerStatefulWidget {
  const MyRouter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyRouterState();
}

class _MyRouterState extends ConsumerState<MyRouter> {
  late UserModel user;
  late AuthState userstate;

  @override
  void initState() {
    super.initState();
    user = UserModel();
    userstate = const AuthState();
  }

  @override
  Widget build(BuildContext context) {
    FutureOr<String?> redirectStrict(
        BuildContext context, GoRouterState state) async {
      checkAuth(ref, user, userstate);

      // get status
      final prefs = await ref.watch(sharedPrefProvider);
      final bool status = prefs.getBool('status') ?? false;

      if (status == false) {
        return '/login';
      } else {
        return null;
      }
    }

    FutureOr<String?> redirectNotStrict(
        BuildContext context, GoRouterState state) async {
      checkAuth(ref, user, userstate);
      return null;
    }

    // GoRouter configuration
    final GoRouter router = GoRouter(
      initialLocation: '/splash',
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
        GoRoute(
          path: '/verify',
          builder: (context, state) => const VerifyUserScreen(),
        ),

        // dashboard screen
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
          redirect: redirectNotStrict,
        ),
        GoRoute(
          path: '/category',
          builder: (context, state) => const CategoryPage(),
          redirect: redirectNotStrict,
        ),
        GoRoute(
          path: '/bible',
          builder: (context, state) => const BibleApi(),
          redirect: redirectNotStrict,
        ),
        GoRoute(
          path: '/keywords/:catid',
          builder: (context, state) {
            final catid = state.pathParameters['catid'];
            return KeywordPage(
              catId: catid!,
            );
          },
          redirect: redirectNotStrict,
        ),
        GoRoute(
          path: '/verse/:keywid',
          builder: (context, state) {
            final keywid = state.pathParameters['keywid'];
            return UserVersePage(
              keywId: keywid!,
            );
          },
          redirect: redirectNotStrict,
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
          redirect: redirectStrict,
        ),
        GoRoute(
          path: '/sub',
          builder: (context, state) => const SubPage(),
          redirect: redirectStrict,
        ),
        GoRoute(
          path: '/favorite',
          builder: (context, state) => const FavouritePage(),
          redirect: redirectStrict,
        ),
        GoRoute(
          path: '/faq',
          builder: (context, state) => const FaqPage(),
          redirect: redirectNotStrict,
        ),

        // admin screen
        GoRoute(
          path: '/admin',
          builder: (context, state) => const AdminHome(),
          redirect: redirectStrict,
        ),
        GoRoute(
          path: '/admin/users',
          builder: (context, state) => const AdminUsers(),
          redirect: redirectStrict,
        ),
        GoRoute(
          path: '/admin/categories',
          builder: (context, state) => const AdminCategory(),
          redirect: redirectStrict,
        ),
        GoRoute(
          path: '/admin/keywords/:catid',
          builder: (context, state) {
            final catid = state.pathParameters['catid'];
            return AdminKeyword(catId: catid);
          },
          redirect: redirectStrict,
        ),
        GoRoute(
          path: '/admin/subscription',
          builder: (context, state) => const AdminSubscription(),
          redirect: redirectStrict,
        ),
        GoRoute(
          path: '/admin/verses/:keywid',
          builder: (context, state) {
            final keywid = state.pathParameters['keywid'];
            return AdminVerses(
              keywid: keywid,
            );
          },
          redirect: redirectStrict,
        ),
      ],
    );

    return MaterialApp.router(
      builder: (BuildContext context, Widget? child) {
        // Set the desired text scale factor here (adjust as needed)
        const double desiredTextScaleFactor = 1;

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(desiredTextScaleFactor),
          ),
          child: child!,
        );
      },
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
