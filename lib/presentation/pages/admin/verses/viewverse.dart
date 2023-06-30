import 'package:bible_compass_app/domain/models/verse/verse.dart';
import 'package:bible_compass_app/domain/providers/verseprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewVerse extends ConsumerWidget {
  final String keywid;
  final String vsId;
  const ViewVerse(this.keywid, this.vsId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamic versefuturesingle =
        Future.delayed(const Duration(seconds: 1), () {
      final versecalled = ref
          .read(verseProvider.notifier)
          .perfromGetSingleVerseRequest(keywid, vsId);
      return versecalled;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Verse'),
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
          child: FutureBuilder<VerseState>(
            future: versefuturesingle,
            builder:
                (BuildContext context, AsyncSnapshot<VerseState> snapshot) {
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
                        title: const Text("Verse:"),
                        trailing: Text(fulldata['bible_verse']),
                      ),
                      ListTile(
                        title: const Text("Passage:"),
                        trailing: Text(fulldata['passage'].toString()),
                      ),
                      ListTile(
                        title: const Text("Explanation:"),
                        trailing: Text(fulldata['explanation'].toString()),
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
