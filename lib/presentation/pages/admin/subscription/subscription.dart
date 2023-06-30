import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/domain/providers/adminusersproviders.dart';
import 'package:bible_compass_app/domain/providers/subproviders.dart';
import 'package:bible_compass_app/presentation/pages/admin/subscription/deletesub.dart';
import 'package:bible_compass_app/presentation/pages/admin/subscription/updatesubscirption.dart';
import 'package:bible_compass_app/presentation/pages/admin/subscription/viewsubscription.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/tophome.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AdminSubscription extends StatelessWidget {
  const AdminSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminHeader(
        title: 'Admin subscription',
      ),
      drawer: const AdminDraw(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0BA37F),
        onPressed: () {
          context.go('/admin');
        },
        child: const Icon(
          Icons.home,
        ),
      ),
      bottomNavigationBar: const AdminBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: const Color(0xFFE2E2E2),
      body: const SizedBox(
        height: 1200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopHomeSubscription(),
              InnerClayListSubscription(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopHomeSubscription extends ConsumerWidget {
  const TopHomeSubscription({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final statscalled = ref.watch(subProvider.notifier).perfromGetSubStats();
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
                final fulldata = snapshot.data?.data['data'];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TopHomeChildren(
                      icons: Icons.category_rounded,
                      title: 'Total Sub',
                      total: fulldata['total_subscription'].toString(),
                    ),
                    TopHomeChildren(
                      icons: Icons.category_outlined,
                      title: 'Active Sub',
                      total: fulldata['active_subscription'].toString(),
                    ),
                    TopHomeChildren(
                      icons: Icons.category_outlined,
                      title: 'Inactive Sub',
                      total: fulldata['inactive_subscription'].toString(),
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

class InnerClayListSubscription extends ConsumerWidget {
  const InnerClayListSubscription({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subfuture = Future.delayed(const Duration(milliseconds: 10), () {
      final subcalled = ref
          .watch(subProvider.notifier)
          .perfromGetSubsRequest(search: ref.watch(searchText));
      return subcalled;
    });
    double listSize = 500;
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
                      "Subscriptions",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SearchTextSub(),
                    SizedBox(
                      height: listSize - 50,
                      child: FutureBuilder<SubscriptionState>(
                        future: subfuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<SubscriptionState> snapshot) {
                          if (snapshot.hasData) {
                            // debugPrint(snapshot.data?.data['data'].toString());
                            final fulldata = snapshot.data?.data['data'];
                            return ListView.builder(
                              itemCount: fulldata.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(fulldata[index]['type']),
                                  subtitle: Text(
                                      fulldata[index]['amount'].toString()),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return AdminUpdateSubscriprion(
                                                  fulldata[index]['id']);
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 20,
                                        ),
                                        tooltip: "edit",
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return DeleteModalSub(
                                                  fulldata[index]['id']);
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 20,
                                        ),
                                        tooltip: "delete",
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return AdminViewSub(
                                                  fulldata[index]['id']);
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 20,
                                        ),
                                        tooltip: "show",
                                      ),
                                    ],
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

class SearchTextSub extends ConsumerWidget {
  const SearchTextSub({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchInputField(
      onChanged: (value) async {
        ref.read(searchText.notifier).state = value;
        await ref
            .refresh(subProvider.notifier)
            .perfromGetSubsRequest(search: ref.watch(searchText));
      },
    );
  }
}
