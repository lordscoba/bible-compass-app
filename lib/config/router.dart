import 'dart:async';
import 'dart:io';

import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/presentation/pages/admin/categories/category.dart';
import 'package:bible_compass_app/presentation/pages/admin/home.dart';
import 'package:bible_compass_app/presentation/pages/admin/keywords/keyword.dart';
import 'package:bible_compass_app/presentation/pages/admin/subscription/subscription.dart';
import 'package:bible_compass_app/presentation/pages/admin/users/users.dart';
import 'package:bible_compass_app/presentation/pages/admin/verses/verse.dart';
import 'package:bible_compass_app/presentation/pages/auth/login.dart';
import 'package:bible_compass_app/presentation/pages/auth/pdf.dart';
import 'package:bible_compass_app/presentation/pages/auth/signup.dart';
import 'package:bible_compass_app/presentation/pages/auth/verify.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/bible.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/category.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/favorite.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/keywords.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/profile.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/sub.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/userverse.dart';
import 'package:bible_compass_app/presentation/pages/error.dart';
import 'package:bible_compass_app/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

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

// for pdf
  String pathAcknowledgement = "";
  String pathPrivacy = "";
  String pathTerms = "";

  @override
  void initState() {
    super.initState();
    user = UserModel();
    userstate = const AuthState();
    // Initialize the variable in initState

// for pdf
    fromAsset('assets/pdfs/Acknowledgement.pdf', 'Acknowledgement.pdf')
        .then((f) {
      setState(() {
        pathAcknowledgement = f.path;
      });
    });
    fromAsset('assets/pdfs/Privacy-Policy.pdf', 'Privacy-Policy.pdf').then((f) {
      setState(() {
        pathPrivacy = f.path;
      });
    });
    fromAsset('assets/pdfs/Terms-of-Service.pdf', 'Terms-of-Service.pdf')
        .then((f) {
      setState(() {
        pathTerms = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    FutureOr<String?> redirect1(
        BuildContext context, GoRouterState state) async {
      final prefs = await ref.watch(sharedPrefProvider);
      // get token
      final bool status = prefs.getBool('status') ?? false;
      if (status == false) {
        return '/login';
      } else {
        checkAuth(ref, user, userstate);
        return null;
      }
    }

    // GoRouter configuration
    final router = GoRouter(
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
        GoRoute(
          path: '/pdf/acknowledgement',
          builder: (context, state) => PDFScreen(path: pathAcknowledgement),
        ),
        GoRoute(
          path: '/pdf/privacy',
          builder: (context, state) => PDFScreen(path: pathPrivacy),
        ),
        GoRoute(
          path: '/pdf/terms',
          builder: (context, state) => PDFScreen(path: pathTerms),
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
          path: '/bible',
          builder: (context, state) => const BibleApi(),
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
      builder: (BuildContext context, Widget? child) {
        // Set the desired text scale factor here (adjust as needed)
        const double desiredTextScaleFactor = 1;

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: desiredTextScaleFactor,
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
