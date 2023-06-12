import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class TopHome extends StatelessWidget {
  const TopHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Align(
        alignment: Alignment.center,
        child: ClayContainer(
          height: 180,
          width: MediaQuery.of(context).size.width - 30,
          borderRadius: 20,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopHomeChildren(
                icons: Icons.account_circle,
                title: 'Total Users',
                total: '86',
              ),
              TopHomeChildren(
                icons: Icons.category_outlined,
                title: 'Total categories',
                total: '8',
              ),
              TopHomeChildren(
                icons: Icons.upgrade_outlined,
                title: 'Total Upgrades',
                total: '20',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopHomeChildren extends StatelessWidget {
  final String title;
  final String total;
  final IconData icons;
  const TopHomeChildren({
    super.key,
    required this.title,
    required this.total,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            // Icons.account_circle,
            icons, size: 55,
            color: Colors.black54,
          ),
          Text(title),
          Text(
            total,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black54),
          )
        ],
      ),
    );
  }
}
