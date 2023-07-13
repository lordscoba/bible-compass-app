import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/domain/providers/subproviders.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VerifySub extends ConsumerWidget {
  final String rid;
  const VerifySub(this.rid, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SubscriptionState paystack = ref.watch(paystackProvider);
    var paystackData = paystack.data['data'];

    final String reference;
    if (paystackData == null) {
      reference = rid;
    } else {
      reference = paystackData['data']['reference'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Sub'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () async {
            Navigator.of(context).pop();
            await ref
                .read(paystackProvider.notifier)
                .perfromGetVerifySubRequest(reference);
          },
        ),
      ),
      backgroundColor: const Color(0xFFE2E2E2),
      body: Center(
          child: ThemeButton(
              text: "Click to verify payment",
              onPressed: () async {
                await ref
                    .read(paystackProvider.notifier)
                    .perfromGetVerifySubRequest(reference);
// ignore: use_build_context_synchronously
                context.push("/sub");
              })),
    );
  }
}
