import 'package:bible_compass_app/domain/models/keyword/keyword.dart';
import 'package:bible_compass_app/domain/providers/keywordproviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewKeyword extends ConsumerWidget {
  final String id;
  const ViewKeyword(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamic keywordfuturesingle =
        Future.delayed(const Duration(seconds: 1), () {
      final keywordcalled =
          ref.read(keywordProvider.notifier).perfromGetSingleKeywordRequest(id);
      return keywordcalled;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Keywords'),
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
          child: FutureBuilder<KeywordState>(
            future: keywordfuturesingle,
            builder:
                (BuildContext context, AsyncSnapshot<KeywordState> snapshot) {
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
                        title: const Text("Keyword:"),
                        trailing: Text(fulldata['keyword']),
                      ),
                      ListTile(
                        title: const Text("For Subscribers:"),
                        trailing: Text(fulldata['for_subscribers'].toString()),
                      ),
                      ListTile(
                        title: const Text("Date Created:"),
                        trailing: Text(fulldata['date_created'].toString()),
                      ),
                      ListTile(
                        title: const Text("Date Updated:"),
                        trailing: Text(fulldata['date_updated'].toString()),
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
