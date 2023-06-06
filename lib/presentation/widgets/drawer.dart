import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Draw extends StatelessWidget {
  const Draw({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.6),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF11dce8).withOpacity(0.3),
              ),
              child: const Icon(Icons.home)),
          ListTile(
            onTap: () {
              context.go('/');
            },
            contentPadding: const EdgeInsets.only(left: 50),
            leading: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              context.go('/list');
            },
            contentPadding: const EdgeInsets.only(left: 50),
            leading: const Icon(
              Icons.list,
              color: Colors.white,
            ),
            title: const Text(
              'List Users',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
