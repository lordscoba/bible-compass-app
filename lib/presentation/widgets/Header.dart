import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const Header({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 9.0, right: 9),
          child: Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class AdminHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AdminHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 9.0, right: 9),
          child: Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
