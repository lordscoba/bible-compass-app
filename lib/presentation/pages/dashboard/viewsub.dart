import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/domain/providers/subproviders.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/verifysub.dart';
import 'package:bible_compass_app/presentation/widgets/themebutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewSub extends ConsumerWidget {
  final String id;
  const ViewSub(this.id, {super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }

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

                final dateCreate = DateTime.parse(fulldata['date_created']);
                final dateExpire = DateTime.parse(fulldata['date_expiring']);
                bool expire = dateCreate.isAfter(dateExpire);

                String? substats;
                TextStyle? substyle;
                if (fulldata['status'] &&
                    !fulldata['processing'] &&
                    !expire &&
                    !fulldata['failed']) {
                  substats = "active";
                  substyle = const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15);
                } else if (!fulldata['status'] &&
                    fulldata['processing'] &&
                    !fulldata['failed']) {
                  substats = "processing";
                  substyle = const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 15);
                } else if (fulldata['failed'] && !fulldata['status']) {
                  substats = "failed";
                  substyle = const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15);
                } else if (!fulldata['processing'] && expire) {
                  substats = "expired";
                  substyle = const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15);
                } else {
                  substats = "Unknown";
                  substyle = const TextStyle(
                      color: Color.fromARGB(255, 44, 42, 42),
                      fontWeight: FontWeight.bold,
                      fontSize: 15);
                }
                // debugPrint(substats);

                return Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: ListView(
                    children: [
                      fulldata['status'] &&
                              !fulldata['processing'] &&
                              !fulldata['failed']
                          ? Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(15.0),
                              decoration: const BoxDecoration(
                                  color: Colors.greenAccent),
                              child: const Text(
                                "Payment Success",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )
                          : fulldata['processing'] && !fulldata['failed']
                              ? Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: const BoxDecoration(
                                      color: Colors.orangeAccent),
                                  child: const Text(
                                    "Payment Still Processing ....",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )
                              : !fulldata['processing'] && fulldata['failed']
                                  ? Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: const BoxDecoration(
                                          color: Colors.redAccent),
                                      child: const Text(
                                        "Payment failed",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: const BoxDecoration(
                                          color: Colors.grey),
                                      child: const Text(
                                        "Payment Expired",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                      ListTile(
                        title: const Text("Sub type:"),
                        trailing: Text(fulldata['type']),
                      ),
                      ListTile(
                        title: const Text("Sub status:"),
                        trailing: Text(
                          substats,
                          style: substyle,
                        ),
                      ),
                      ListTile(
                        title: const Text("Sub amount:"),
                        trailing: Text("${fulldata['amount'].toString()}USD"),
                      ),
                      ListTile(
                        title: const Text("Sub Duration:"),
                        trailing: Text(
                            "${fulldata['duration'].toString()} day${(fulldata['duration'] > 1 ? 's' : '')}"),
                      ),
                      ListTile(
                          title: const Text("Date created:"),
                          trailing: Text(
                            DateFormat('yyyy-MM-dd').format(
                              DateTime.parse(fulldata['date_created']),
                            ),
                            style: const TextStyle(color: Colors.black54),
                          )
                          //  Text(fulldata['date_created'].toString()),
                          ),
                      ListTile(
                        title: const Text("Date expiring:"),
                        trailing: Text(
                          DateFormat('yyyy-MM-dd').format(
                            DateTime.parse(fulldata['date_expiring']),
                          ),
                          style: const TextStyle(color: Colors.black54),
                        ),
                        //  Text(fulldata['date_expiring'].toString()),
                      ),
                      !fulldata['status'] &&
                              fulldata['processing'] &&
                              !fulldata['failed']
                          ? ThemeButton(
                              text: "Continue Payment",
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return VerifySub(
                                      fulldata['user_id'],
                                    );
                                  },
                                );
                                final Uri url =
                                    Uri.parse(fulldata["authorization_url"]);
                                _launchUrl(url);
                              },
                            )
                          : const SizedBox(),
                    ],
                  ),
                );

                // return const Text("hello hasdata");
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Scaffold(
                  body: Center(
                    child: CupertinoActivityIndicator(
                      radius: 50,
                    ),
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
