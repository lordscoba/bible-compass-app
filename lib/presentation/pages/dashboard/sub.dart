import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubPage extends ConsumerWidget {
  const SubPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final catsfuture = Future.delayed(const Duration(seconds: 1), () {
    //   final catscalled =
    //       ref.watch(categoryProvider.notifier).perfromGetCatgeoriesRequest();
    //   return catscalled;
    // });
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: const Header(
        title: 'Subscription',
      ),
      drawer: const Draw(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0BA37F),
        onPressed: () {},
        child: const Icon(
          Icons.home,
        ),
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: const Color(0xFFF6F8FF),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/wallpaper1.jpeg"),
              fit: BoxFit.cover),
        ),
        height: double.infinity,
        // height: 1200,
        width: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 80,
            child: const Placeholder(),
          ),
        ),
      ),
    );
  }
}
