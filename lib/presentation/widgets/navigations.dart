import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      color: const Color(0xFF0BA37F),
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.article_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                context.go('/category');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AdminBottomBar extends StatelessWidget {
  const AdminBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      color: const Color(0xFF0BA37F),
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.article_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                context.go('/admin/categories');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.account_box_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                context.go('/admin/users');
              },
            ),
          ),
        ],
      ),
    );
  }
}
