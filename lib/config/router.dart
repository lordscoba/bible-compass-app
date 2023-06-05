import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyRouter extends ConsumerWidget {
  const MyRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // GoRouter configuration
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const Placeholder(),
        ),
      ],
    );

    return MaterialApp(
      home: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
