import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/subproviders.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/createsub.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/viewsub.dart';
import 'package:bible_compass_app/presentation/widgets/addsomething.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/tophome.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SubPage extends ConsumerWidget {
  const SubPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthState auth = ref.watch(loginProvider);
    var authData = auth.data['data'];
    return Scaffold(
      appBar: const Header(
        title: 'Subscription',
      ),
      drawer: const Draw(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0BA37F),
        onPressed: () {
          context.go("/home");
        },
        child: const Icon(
          Icons.home,
        ),
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: const Color(0xFFF6F8FF),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200),
        height: double.infinity,
        // height: 1200,
        width: double.infinity,
        child: SizedBox(
          height: 1200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopHomeSub(),
                AddSomething(
                  text: 'Want to add Subscription',
                  icon: Icons.add_circle_outline,
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return const CreateSub();
                      },
                    );
                  },
                ),
                InnerClayListCategory(
                  userId: authData['id'],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopHomeSub extends ConsumerWidget {
  const TopHomeSub({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthState auth = ref.watch(loginProvider);
    var authData = auth.data['data'];

    final statsfuture = Future.delayed(const Duration(seconds: 1), () {
      final statscalled = ref
          .watch(subProvider.notifier)
          .perfromGetUserSubStats(authData['id']);
      return statscalled;
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Align(
        alignment: Alignment.center,
        child: ClayContainer(
          height: 180,
          width: MediaQuery.of(context).size.width - 30,
          borderRadius: 20,
          child: FutureBuilder<SubscriptionState>(
            future: statsfuture,
            builder: (BuildContext context,
                AsyncSnapshot<SubscriptionState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final fulldata = snapshot.data?.data['data'] ?? '';
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TopHomeChildren(
                      icons: Icons.payment,
                      title: 'Total Sub',
                      total: fulldata.isNotEmpty
                          ? fulldata['total_subscription'].toString()
                          : '',
                    ),
                    TopHomeChildren(
                      icons: Icons.payment,
                      title: 'Active Sub',
                      total: fulldata.isNotEmpty
                          ? fulldata['active_subscription'].toString()
                          : '',
                    ),
                    TopHomeChildren(
                      icons: Icons.payment,
                      title: 'Inactive Sub',
                      total: fulldata.isNotEmpty
                          ? fulldata['inactive_subscription'].toString()
                          : '',
                    ),
                  ],
                );

                // return const Text("hello hasdata");
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

class InnerClayListCategory extends ConsumerWidget {
  final String userId;
  const InnerClayListCategory({
    required this.userId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subfuture = Future.delayed(const Duration(seconds: 1), () {
      final subcalled =
          ref.watch(subProvider.notifier).perfromGetUserSubsRequests(userId);
      return subcalled;
    });
    double listSize = 350;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Align(
        alignment: Alignment.center,
        child: ClayContainer(
            height: listSize,
            width: MediaQuery.of(context).size.width - 30,
            borderRadius: 20,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      "Subs",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(
                      height: listSize - 50,
                      child: FutureBuilder<SubscriptionState>(
                        future: subfuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<SubscriptionState> snapshot) {
                          if (snapshot.hasData) {
                            // debugPrint(snapshot.data?.data['data'].toString());
                            final fulldata = snapshot.data?.data['data'] ?? '';

                            return ListView.builder(
                              itemCount: fulldata.length,
                              itemBuilder: (context, index) {
                                final dateCreate = DateTime.parse(
                                    fulldata[index]['date_created']);
                                final dateExpire = DateTime.parse(
                                    fulldata[index]['date_expiring']);
                                bool expire = dateCreate.isAfter(dateExpire);

                                String? substats;
                                TextStyle? substyle;
                                if (fulldata[index]['status'] &&
                                    !fulldata[index]['processing'] &&
                                    !expire &&
                                    !fulldata[index]['failed']) {
                                  substats = "active";
                                  substyle = const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15);
                                } else if (!fulldata[index]['status'] &&
                                    fulldata[index]['processing'] &&
                                    !fulldata[index]['failed']) {
                                  substats =
                                      "processing..., Click to continue payment!";
                                  substyle = const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15);
                                } else if (fulldata[index]['failed'] &&
                                    !fulldata[index]['status']) {
                                  substats = "failed";
                                  substyle = const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15);
                                } else if (!fulldata[index]['processing'] &&
                                    expire) {
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

                                return ListTile(
                                  title: Text(
                                    "${(index + 1).toString()}, ${fulldata[index]['type'].toUpperCase()},  Amount: \$${fulldata[index]['amount'].toString()}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                  subtitle: Text(
                                    substats,
                                    style: substyle,
                                  ),
                                  trailing: IconButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return ViewSub(
                                            fulldata[index]['id'],
                                          );
                                          // return VerifySub(
                                          //   fulldata[index]['id'],
                                          // );
                                        },
                                      );
                                      await ref
                                          .read(paystackProvider.notifier)
                                          .perfromGetVerifySubRequest(
                                              fulldata[index]['reference']);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 20,
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return const Center(
                              child: CupertinoActivityIndicator(
                                radius: 50,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
