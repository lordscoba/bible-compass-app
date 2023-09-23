import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowRateUs extends ConsumerWidget {
  ShowRateUs({super.key});
  final Uri _url = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.snappyfix.bible_compass_app');
  Future<void> _launchUrl() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_url');
    }
  }

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        now.weekday == DateTime.tuesday ||
                now.weekday == DateTime.wednesday ||
                now.weekday == DateTime.sunday
            ? TextButton(
                onPressed: _launchUrl,
                child: const Text(
                  "Rate Us!",
                  style: TextStyle(
                    color: Color(0xFF0BA37F),
                  ),
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
