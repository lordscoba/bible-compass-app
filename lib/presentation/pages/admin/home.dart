import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/addsomething.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/innerclaylist.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/tophome.dart';
import 'package:bible_compass_app/presentation/widgets/tophomedouble.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminHeader(
        title: 'Admin Home',
      ),
      drawer: const AdminDraw(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0BA37F),
        onPressed: () {
          context.go('admin/home');
        },
        child: const Icon(
          Icons.home,
        ),
      ),
      bottomNavigationBar: const AdminBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: const Color(0xFFE2E2E2),
      body: const SizedBox(
        height: 1200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopHome(),
              TopHomeDouble(),
              AddSomething(
                text: 'Want to add Category?',
                icon: Icons.add_circle_outline,
              ),
              AddSomething(
                text: 'View App Data',
                icon: Icons.arrow_forward_ios,
              ),
              InnerClayList()
            ],
          ),
        ),
      ),
    );
  }
}
