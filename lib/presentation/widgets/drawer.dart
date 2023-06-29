import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Draw extends ConsumerWidget {
  const Draw({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: 300,
      // backgroundColor: Colors.black.withOpacity(0.6),
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Image(
              width: 50,
              image: AssetImage("assets/images/compass-top.png"),
            ),
          ),
          DrawerPart(
            text: 'Home',
            icon: Icons.home,
            onTap: () {
              context.push('/home');
            },
          ),
          DrawerPart(
            icon: Icons.category_outlined,
            text: 'Categories',
            onTap: () {
              context.push('/category');
            },
          ),
          DrawerPart(
            icon: Icons.payment,
            text: 'Upgrade Plan',
            onTap: () {
              context.push('/sub');
            },
          ),
          DrawerPart(
            icon: Icons.favorite_border,
            text: 'favorite',
            onTap: () {
              context.push('/favorite');
            },
          ),
          DrawerPart(
            icon: Icons.account_circle_outlined,
            text: 'profile',
            onTap: () {
              context.push('/profile');
            },
          ),
          DrawerPart(
            icon: Icons.logout_outlined,
            text: 'logout',
            onTap: () async {
              ref.invalidate(loginProvider);
              context.go('/login');
              // final SharedPreferences prefs =
              //     await SharedPreferences.getInstance();
              final prefs = await ref.watch(sharedPrefProvider);
              await prefs.clear();
              final String? username = prefs.getString('username');
              debugPrint(username);
            },
          ),
        ],
      ),
    );
  }
}

class AdminDraw extends ConsumerWidget {
  const AdminDraw({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: 300,
      // backgroundColor: Colors.black.withOpacity(0.6),
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Image(
              width: 50,
              image: AssetImage("assets/images/compass-top.png"),
            ),
          ),
          DrawerPart(
            text: 'Home',
            icon: Icons.home,
            onTap: () {
              context.go('/admin');
            },
          ),
          DrawerPart(
            text: 'Users',
            icon: Icons.account_circle,
            onTap: () {
              context.push('/admin/users');
            },
          ),
          DrawerPart(
            icon: Icons.category_outlined,
            text: 'Categories',
            onTap: () {
              context.push('/admin/categories');
            },
          ),
          // DrawerPart(
          //   icon: Icons.category_outlined,
          //   text: 'keywords',
          //   onTap: () {
          //     context.go('/admin/keywords');
          //   },
          // ),
          DrawerPart(
            icon: Icons.money,
            text: 'Subscription',
            onTap: () {
              context.push('/admin/subscription');
            },
          ),
          DrawerPart(
            icon: Icons.logout_outlined,
            text: 'logout',
            onTap: () async {
              ref.invalidate(loginProvider);
              context.go('/login');
              // final SharedPreferences prefs =
              //     await SharedPreferences.getInstance();
              final prefs = await ref.watch(sharedPrefProvider);
              await prefs.clear();
              final String? username = prefs.getString('username');
              debugPrint(username);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerPart extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData? icon;
  const DrawerPart({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.only(left: 50),
      leading: Icon(
        icon,
        color: Colors.black45,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 19,
        ),
      ),
    );
  }
}
