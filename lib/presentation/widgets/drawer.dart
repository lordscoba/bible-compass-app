import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Draw extends StatelessWidget {
  const Draw({super.key});

  @override
  Widget build(BuildContext context) {
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
              context.go('/home');
            },
          ),
          DrawerPart(
            icon: Icons.category_outlined,
            text: 'Categories',
            onTap: () {
              context.go('/category');
            },
          ),
          DrawerPart(
            icon: Icons.payment,
            text: 'Upgrade Plan',
            onTap: () {
              context.go('/home');
            },
          ),
          DrawerPart(
              icon: Icons.logout_outlined,
              text: 'logout',
              onTap: () {
                context.go('/login');
              }),
        ],
      ),
    );
  }
}

class AdminDraw extends StatelessWidget {
  const AdminDraw({super.key});

  @override
  Widget build(BuildContext context) {
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
            icon: Icons.category_outlined,
            text: 'Categories',
            onTap: () {
              context.go('/admin/categories');
            },
          ),
          DrawerPart(
            icon: Icons.category_outlined,
            text: 'keywords',
            onTap: () {
              context.go('/admin/keywords');
            },
          ),
          DrawerPart(
            icon: Icons.money,
            text: 'Subscription',
            onTap: () {
              context.go('/admin/subscription');
            },
          ),
          DrawerPart(
            icon: Icons.book,
            text: 'Verses',
            onTap: () {
              context.go('/admin/verses');
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
