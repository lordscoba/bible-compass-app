import 'package:bible_compass_app/domain/models/verse/verse.dart';
import 'package:bible_compass_app/domain/providers/verseprovider.dart';
import 'package:bible_compass_app/presentation/pages/admin/verses/createverse.dart';
import 'package:bible_compass_app/presentation/pages/admin/verses/deleteverse.dart';
import 'package:bible_compass_app/presentation/pages/admin/verses/updateverse.dart';
import 'package:bible_compass_app/presentation/pages/admin/verses/viewverse.dart';
import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/addsomething.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/tophome.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AdminVerses extends StatelessWidget {
  final String? keywid;
  const AdminVerses({super.key, this.keywid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminHeader(
        title: 'Admin Verses',
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
              const TopHomeVerse(),
              AddSomething(
                text: 'Want to add verses?',
                icon: Icons.add_circle_outline,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return CreateVerses(
                        keywId: keywid!,
                      );
                    },
                  );
                },
              ),
              InnerClayListVerse(
                keywid: keywid,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopHomeVerse extends StatelessWidget {
  const TopHomeVerse({
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
                title: 'Total verses',
                total: '86',
              ),
              TopHomeChildren(
                icons: Icons.category_outlined,
                title: 'Subed verses',
                total: '8',
              ),
              TopHomeChildren(
                icons: Icons.category_outlined,
                title: 'Unsubed verses',
                total: '20',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InnerClayListVerse extends ConsumerWidget {
  final String? keywid;
  const InnerClayListVerse({
    this.keywid,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final versefuture = Future.delayed(const Duration(seconds: 1), () {
      final versecalled =
          ref.watch(verseProvider.notifier).perfromGetVersesRequest(keywid!);
      return versecalled;
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
                      "Verses",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(
                      height: listSize - 50,
                      child: FutureBuilder<VerseState>(
                        future: versefuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<VerseState> snapshot) {
                          if (snapshot.hasData) {
                            // debugPrint(snapshot.data?.data['data'].toString());
                            final fulldata = snapshot.data?.data['data'];
                            return ListView.builder(
                                itemCount: fulldata?.length,
                                itemBuilder: (context, index) {
                                  if (fulldata?[index] == null) {
                                    // return const Text('Null Value');
                                    return null;
                                  }
                                  return ListTile(
                                    title: Text(
                                        fulldata[index]['bible_verse'] ?? "N"),
                                    subtitle:
                                        const Text("Not a registered user"),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              builder: (BuildContext context) {
                                                return UpdateVerse(
                                                  vId: fulldata[index]['id'],
                                                  keyId: keywid!,
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
                                                return DeleteModalVerse(keywid!,
                                                    fulldata[index]['id']);
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
                                                return ViewVerse(keywid!,
                                                    fulldata[index]['id']);
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
                                });

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
