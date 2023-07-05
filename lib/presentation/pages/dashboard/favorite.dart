import 'package:bible_compass_app/domain/models/favourites/favorite.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/favproviders.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthState auth = ref.watch(loginProvider);
    var authData = auth.data['data'];
    // debugPrint(authData.toString());

    // debugPrint(authData["email"]);

    final favsfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final favscalled = ref
          .watch(favProvider.notifier)
          .perfromGetFavsRequest(authData["email"]);

      return favscalled;
    });
    return Scaffold(
      appBar: const Header(
        title: 'Favourites',
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
              image: AssetImage("assets/images/jesus1.jpg"), fit: BoxFit.cover),
        ),
        height: double.infinity,
        // height: 1200,
        width: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 80,
            child: FutureBuilder<FavoriteState>(
              future: favsfuture,
              builder: (BuildContext context,
                  AsyncSnapshot<FavoriteState> snapshot) {
                if (snapshot.hasData) {
                  // debugPrint(snapshot.data?.data['data'].toString());
                  final fulldata = snapshot.data?.data['data'];

                  if (fulldata.isNotEmpty) {
                    return ListView.builder(
                      itemCount: fulldata.length,
                      itemBuilder: (context, index) {
                        return FadeIn(
                          duration: Duration(milliseconds: 300 + (300 * index)),
                          curve: Curves.easeIn,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF0BA37F),
                                  Color.fromARGB(255, 9, 144, 99),
                                  Color.fromARGB(255, 3, 47, 34),
                                ],
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                fulldata[index]['keyword'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        // favcolor = false;
                                        await ref
                                            .read(favProvider.notifier)
                                            .perfromUnLikeRequest(
                                                fulldata[index]['keyword'],
                                                authData['email']);
                                        await ref
                                            .refresh(favProvider.notifier)
                                            .perfromGetFavsRequest(
                                                authData['email']);
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                  IconButton(
                                    onPressed: () {
                                      // debugPrint(fulldata[index]['id']);
                                      context.push(
                                          "/verse/${fulldata[index]['id']}");
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 20),
                              enabled: true,
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return SizedBox(
                      height: 330,
                      child: ListView(
                        children: const [
                          SizedBox(
                            height: 50,
                          ),
                          ListTile(
                            title: Text(
                              "No data",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Color(0xFF0BA37F),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              "Try making some keywords your favorite",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

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
      ),
    );
  }
}
