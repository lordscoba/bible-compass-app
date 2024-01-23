// ignore: file_names
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const Header({
    super.key,
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final currentRoute =
        GoRouter.of(context).routeInformationProvider.value.location;
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      actions: [
        currentRoute != '/home'
            ? Padding(
                padding: const EdgeInsets.only(top: 9.0, right: 9),
                child: TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      debugPrint("cannot pop");
                      // debugPrint(currentRoute);
                      // context.pop();
                    }
                  },
                  child: const Text(
                    "Close",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              )
            : const SizedBox(),
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
    // final currentRoute = Navigator.of(context).currentRoute;
    final currentRoute =
        GoRouter.of(context).routeInformationProvider.value.location;
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      actions: [
        currentRoute != '/admin'
            ? Padding(
                padding: const EdgeInsets.only(top: 9.0, right: 9),
                child: TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      debugPrint("cannot pop");
                      debugPrint(currentRoute);
                      // context.pop();
                    }
                  },
                  child: const Text(
                    "Close",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
