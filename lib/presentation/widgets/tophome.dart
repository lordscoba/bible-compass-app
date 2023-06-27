import 'package:bible_compass_app/domain/models/category/category.dart';
import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/adminusersproviders.dart';
import 'package:bible_compass_app/domain/providers/categoryproviders.dart';
import 'package:bible_compass_app/domain/providers/subproviders.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            children: [TopStatsUsers(), TopStatsCategory(), TopStatsSub()],
          ),
        ),
      ),
    );
  }
}

class TopStatsUsers extends ConsumerWidget {
  const TopStatsUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final statscalled =
          ref.watch(adminUserProvider.notifier).perfromGetUserStats();
      return statscalled;
    });

    return FutureBuilder<UserState>(
      future: statsfuture,
      builder: (BuildContext context, AsyncSnapshot<UserState> snapshot) {
        if (snapshot.hasData) {
          // debugPrint(snapshot.data?.data['data'].toString());
          final fulldata = snapshot.data?.data['data'];
          return TopHomeChildren(
            icons: Icons.account_circle,
            title: 'Total Users',
            total: fulldata['total_users'].toString(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class TopStatsCategory extends ConsumerWidget {
  const TopStatsCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final statscalled =
          ref.watch(categoryProvider.notifier).perfromGetCategoryStats();
      return statscalled;
    });

    return FutureBuilder<CategoryState>(
      future: statsfuture,
      builder: (BuildContext context, AsyncSnapshot<CategoryState> snapshot) {
        if (snapshot.hasData) {
          // debugPrint(snapshot.data?.data['data'].toString());
          final fulldata = snapshot.data?.data['data'];
          return TopHomeChildren(
            icons: Icons.category_outlined,
            title: 'Total Cat',
            total: fulldata['total_category'].toString(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class TopStatsSub extends ConsumerWidget {
  const TopStatsSub({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final statscalled = ref.watch(subProvider.notifier).perfromGetSubStats();
      return statscalled;
    });

    return FutureBuilder<SubscriptionState>(
      future: statsfuture,
      builder:
          (BuildContext context, AsyncSnapshot<SubscriptionState> snapshot) {
        if (snapshot.hasData) {
          // debugPrint(snapshot.data?.data['data'].toString());
          final fulldata = snapshot.data?.data['data'];
          return TopHomeChildren(
            icons: Icons.upgrade_outlined,
            title: 'Total Sub',
            total: fulldata['total_subscription'].toString(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class TopHomeChildren extends StatelessWidget {
  final String title;
  final String? total;
  final IconData icons;
  const TopHomeChildren({
    super.key,
    required this.title,
    this.total,
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
            total!,
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
