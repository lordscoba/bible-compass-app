import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/domain/providers/subproviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminViewSub extends ConsumerWidget {
  final String id;
  const AdminViewSub(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamic subfuturesingle =
        Future.delayed(const Duration(seconds: 1), () {
      final subcalled =
          ref.read(subProvider.notifier).perfromGetSingleSubRequest(id);
      return subcalled;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Sub'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0xFFE2E2E2),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<SubscriptionState>(
            future: subfuturesingle,
            builder: (BuildContext context,
                AsyncSnapshot<SubscriptionState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final fulldata = snapshot.data?.data['data'];
                // debugPrint(fulldata['name'].toString());
                // debugPrint(fulldata.toString());
                return Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text("Sub type:"),
                        trailing: Text(fulldata['type']),
                      ),
                      ListTile(
                        title: const Text("Sub status:"),
                        trailing: Text(fulldata['status'].toString()),
                      ),
                      ListTile(
                        title: const Text("Sub amount:"),
                        trailing: Text(fulldata['amount'].toString()),
                      ),
                      ListTile(
                        title: const Text("Sub Duration:"),
                        trailing: Text(fulldata['duration'].toString()),
                      ),
                      ListTile(
                        title: const Text("Date created:"),
                        trailing: Text(fulldata['date_created'].toString()),
                      ),
                      ListTile(
                        title: const Text("Date expiring:"),
                        trailing: Text(fulldata['date_expiring'].toString()),
                      ),
                    ],
                  ),
                );

                // return const Text("hello hasdata");
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ),
      ),
    );
  }
}
