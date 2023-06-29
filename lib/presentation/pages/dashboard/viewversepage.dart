import 'package:bible_compass_app/domain/models/verse/verse.dart';
import 'package:bible_compass_app/domain/providers/verseprovider.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:bible_compass_app/utils/copy.dart';
import 'package:bible_compass_app/utils/snacksbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class ViewVerseDetails extends ConsumerWidget {
  final String keywid;
  final String vsId;
  const ViewVerseDetails(this.keywid, this.vsId, {super.key});

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
                debugPrint(fulldata.toString());
                return Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Verse",
                            style: TextStyle(
                                color: Color(0xFF0BA37F),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const HorizontalSpace(),
                          Text(
                            fulldata['bible_verse'],
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      const HorizontalSpace(),
                      const HorizontalSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  "Passage",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 158, 163, 11),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const HorizontalSpace(),
                                Text(
                                  fulldata['passage'],
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                          IntrinsicWidth(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    copyToClipboard(fulldata['passage']);
                                    showSnackBar(context, "passage copied");
                                  },
                                  icon: const Icon(Icons.copy),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await Share.share(fulldata['passage'],
                                        subject: "Passage");
                                  },
                                  icon: const Icon(Icons.share),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const HorizontalSpace(),
                      const HorizontalSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 350,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "Explanation",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 163, 100, 11),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const HorizontalSpace(),
                                  Text(
                                    fulldata['explanation'],
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ),
                          IntrinsicWidth(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    copyToClipboard(fulldata['explanation']);
                                    showSnackBar(context, "explanation copied");
                                  },
                                  icon: const Icon(Icons.copy),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await Share.share(fulldata['explanation'],
                                        subject: "Explanation");
                                  },
                                  icon: const Icon(Icons.share),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );

                // return const Text("hello hasdata");
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Scaffold(
                  body: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
