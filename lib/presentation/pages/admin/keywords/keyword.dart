import 'package:bible_compass_app/domain/models/keyword/keyword.dart';
import 'package:bible_compass_app/domain/providers/keywordproviders.dart';
import 'package:bible_compass_app/presentation/pages/admin/keywords/createkeyword.dart';
import 'package:bible_compass_app/presentation/pages/admin/keywords/deletekeyword.dart';
import 'package:bible_compass_app/presentation/pages/admin/keywords/updatekeyword.dart';
import 'package:bible_compass_app/presentation/pages/admin/keywords/viewkeyword.dart';
import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/addsomething.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/tophome.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AdminKeyword extends StatelessWidget {
  final String? catId;
  const AdminKeyword({super.key, this.catId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminHeader(
        title: 'Admin Keywords',
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
      body: SizedBox(
        height: 1200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopHomekeyword(),
              AddSomething(
                text: 'Want to add Keyword?',
                icon: Icons.add_circle_outline,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Createkeyword(
                        catId: catId as String,
                      );
                    },
                  );
                },
              ),
              InnerClayListKeyword(
                catId: catId,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopHomekeyword extends StatelessWidget {
  const TopHomekeyword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Align(
        alignment: Alignment.center,
        child: ClayContainer(
          height: 180,
          width: MediaQuery.of(context).size.width - 30,
          borderRadius: 20,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopHomeChildren(
                icons: Icons.category_rounded,
                title: 'Total keys',
                total: '86',
              ),
              TopHomeChildren(
                icons: Icons.category_outlined,
                title: 'Subed keys',
                total: '8',
              ),
              TopHomeChildren(
                icons: Icons.category_outlined,
                title: 'Unsubed Upgrades',
                total: '20',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InnerClayListKeyword extends ConsumerWidget {
  final String? catId;
  const InnerClayListKeyword({
    this.catId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keywfuture = Future.delayed(const Duration(seconds: 1), () {
      final keywcalled =
          ref.watch(keywordProvider.notifier).perfromGetKeywordsRequest(catId!);
      return keywcalled;
    });
    double listSize = 250;
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
                      "keywords",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(
                      height: listSize - 50,
                      child: FutureBuilder<KeywordState>(
                        future: keywfuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<KeywordState> snapshot) {
                          if (snapshot.hasData) {
                            // debugPrint(snapshot.data?.data['data'].toString());
                            final fulldata = snapshot.data?.data['data'];
                            return ListView.builder(
                              itemCount: fulldata.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(fulldata[index]['keyword']),
                                  subtitle: const Text("Not a registered user"),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return UpdateKeyword(
                                                keyId: fulldata[index]['id'],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return DeleteModalKeywords(
                                                fulldata[index]['id'],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return ViewKeyword(
                                                fulldata[index]['id'],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context.go(
                                              "/admin/verses/${fulldata[index]['id']}");
                                        },
                                        icon: const Icon(
                                          Icons.list_alt,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );

                            // return const Text("hello hasdata");
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return const CircularProgressIndicator();
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
