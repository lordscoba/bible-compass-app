import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/adminusersproviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewUser extends ConsumerWidget {
  final String id;
  const ViewUser(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamic usersfuturesingle =
        Future.delayed(const Duration(seconds: 1), () {
      final userscalled =
          ref.read(adminUserProvider.notifier).perfromGetSingleUserRequest(id);
      return userscalled;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Users'),
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
          child: FutureBuilder<UserState>(
            future: usersfuturesingle,
            builder: (BuildContext context, AsyncSnapshot<UserState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final fulldata = snapshot.data?.data['data'];
                // debugPrint(fulldata['name'].toString());
                debugPrint(fulldata.toString());
                return Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text("Email:"),
                        trailing: Text(fulldata['email']),
                      ),
                      ListTile(
                        title: const Text("Username:"),
                        trailing: Text(fulldata['username']),
                      ),
                      ListTile(
                        title: const Text("Name:"),
                        trailing: Text(fulldata['name']),
                      ),
                      ListTile(
                        title: const Text("Type:"),
                        trailing: Text(fulldata['type']),
                      ),
                      ListTile(
                        title: const Text("Is Verified:"),
                        trailing: Text(fulldata['is_verified'].toString()),
                      ),
                      ListTile(
                        title: const Text("Date Created:"),
                        trailing: Text(fulldata['date_created']),
                      )
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
