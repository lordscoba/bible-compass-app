import 'package:bible_compass_app/domain/models/verse/verse.dart';
import 'package:bible_compass_app/domain/providers/verseprovider.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/viewversepage.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserVersePage extends ConsumerWidget {
  final String keywId;
  const UserVersePage({required this.keywId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final versefuture = Future.delayed(const Duration(milliseconds: 100), () {
      final versecalled =
          ref.watch(verseProvider.notifier).perfromGetVersesRequest(keywId);
      return versecalled;
    });
    debugPrint(versefuture.toString());
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: const Header(
        title: 'Bible Verses',
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
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/wallpaper1.jpeg"),
              fit: BoxFit.cover),
        ),
        height: double.infinity,
        // height: 1200,
        width: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 80,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FutureBuilder<VerseState>(
                future: versefuture,
                builder:
                    (BuildContext context, AsyncSnapshot<VerseState> snapshot) {
                  if (snapshot.hasData) {
                    // debugPrint(snapshot.data?.data['data'].toString());
                    final fulldata = snapshot.data?.data['data'];
                    if (fulldata == null) {
                      return Center(
                          child: ClayContainer(
                              width: 200,
                              height: 200,
                              child: const Center(
                                child: Text(
                                  "No verse",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )));
                    } else {
                      return Wrap(
                        spacing: 5.0, // horizontal spacing between items
                        runSpacing: 5.0, // vertical spacing between lines
                        children: fulldata.map<Widget>(
                          (item) {
                            final idx = fulldata.indexOf(item);
                            return FadeIn(
                              duration: Duration(
                                  milliseconds: 300 + (300 * idx as int)),
                              curve: Curves.easeIn,
                              child: MyChipV(
                                text: item['bible_verse'].toString(),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return ViewVerseDetails(
                                          keywId, item['id']);
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ).toList(),
                      );
                    }
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
          ),
        ),
      ),
    );
  }
}

class MyChipV extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyChipV({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white38, width: 4),
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0BA37F),
                Color.fromARGB(255, 9, 144, 99),
                Color.fromARGB(255, 3, 47, 34),
              ],
            ),
          ),
          width: double.infinity,
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
