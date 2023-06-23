import 'package:bible_compass_app/domain/models/favourites/favorite.dart';
import 'package:bible_compass_app/domain/models/keyword/keyword.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/favproviders.dart';
import 'package:bible_compass_app/domain/providers/keywordproviders.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class KeywordPage extends ConsumerWidget {
  final String catId;
  const KeywordPage({required this.catId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthState auth = ref.watch(loginProvider);
    var authData = auth.data['data'];
    final keywfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final keywcalled =
          ref.watch(keywordProvider.notifier).perfromGetKeywordsRequest(catId);
      return keywcalled;
    });
    // debugPrint(keywfuture.toString());
    return Scaffold(
      appBar: const Header(
        title: 'Keywords',
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
                      children: fulldata.map<Widget>(
                        (item) {
                          final idx = fulldata.indexOf(item);
                          return FadeIn(
                            duration: Duration(
                                milliseconds: 300 + (300 * idx as int)),
                            curve: Curves.easeIn,
                            child: MyChip(
                              text: item['keyword'].toString(),
                              onTap: () {
                                // debugPrint(item['keyword']);
                                // debugPrint(authData['email']);
                                context.push("/verse/${item['id']}");
                              },
                              favButton: LikeButton(
                                email: authData['email'],
                                keyword: item['keyword'],
                              ),
                            ),
                          );
                        },
                      ).toList(),
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

class LikeButton extends ConsumerWidget {
  final String keyword;
  final String email;
  const LikeButton({
    required this.keyword,
    required this.email,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final statscalled = ref
          .watch(favProviderstatus.notifier)
          .perfromGetStatusRequest(keyword, email);
      return statscalled;
    });
    return FutureBuilder<FavoriteState>(
      future: statsfuture,
      builder: (BuildContext context, AsyncSnapshot<FavoriteState> snapshot) {
        if (snapshot.hasData) {
          debugPrint(snapshot.data?.data['data'].toString());
          final fulldata = snapshot.data?.data['data'];
          return IconButton(
            onPressed: () async {
              if (!fulldata['status']) {
                await ref
                    .read(favProvider.notifier)
                    .perfromLikeRequest(keyword, email);
              } else {
                await ref
                    .read(favProvider.notifier)
                    .perfromUnLikeRequest(keyword, email);
              }
              await ref
                  .refresh(favProviderstatus.notifier)
                  .perfromGetStatusRequest(keyword, email);
            },
            icon: fulldata['status']
                ? const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class MyChip extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Widget? favButton;
  const MyChip({
    super.key,
    required this.text,
    this.onTap,
    this.favButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 3),
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
              favButton!,
            ],
          ),
        ),
      ),
    );
  }
}
