import 'package:bible_compass_app/domain/models/keyword/keyword.dart';
import 'package:bible_compass_app/domain/providers/keywordproviders.dart';
import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class KeywordPage extends ConsumerWidget {
  final String catId;
  const KeywordPage({required this.catId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keywfuture = Future.delayed(const Duration(seconds: 3), () {
      final keywcalled =
          ref.watch(keywordProvider.notifier).perfromGetKeywordsRequest(catId);
      return keywcalled;
    });
    // debugPrint(keywfuture.toString());
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: const Header(
        title: 'Keywords',
      ),
      drawer: const Draw(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0BA37F),
        onPressed: () {},
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
              child: FutureBuilder<KeywordState>(
                future: keywfuture,
                builder: (BuildContext context,
                    AsyncSnapshot<KeywordState> snapshot) {
                  if (snapshot.hasData) {
                    // debugPrint(snapshot.data?.data['data'].toString());
                    final fulldata = snapshot.data?.data['data'];
                    return Wrap(
                      spacing: 5.0, // horizontal spacing between items
                      runSpacing: 5.0, // vertical spacing between lines
                      children: fulldata
                          .map<Widget>(
                            (item) => MyChip(
                              text: item['keyword'].toString(),
                              onTap: () {
                                context.go("/verse/${item['ID']}");
                              },
                            ),
                          )
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
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

class MyChip extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyChip({
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
            border: Border.all(color: Colors.black87, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
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
          // color: Colors.black38,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}