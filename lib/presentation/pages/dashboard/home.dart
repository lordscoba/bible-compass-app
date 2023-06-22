import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bible_compass_app/domain/models/favourites/favorite.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/favproviders.dart';
import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthState auth = ref.watch(loginProvider);
    var authData = auth.data['data'];
    // debugPrint(authData.toString());

    () async {
      final prefs = await ref.watch(sharedPrefProvider);
      final String? username = prefs.getString('username');

      debugPrint(username);
    }();

    // debugPrint(authData["email"]);

    final favsfuture = Future.delayed(const Duration(seconds: 1), () {
      final favscalled = ref
          .watch(favProvider.notifier)
          .perfromGetFavsRequest(authData["email"]);
      return favscalled;
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const Header(
        title: 'Home',
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
        height: 1200,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HorizontalSpace(),
              const HorizontalSpace(),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Image(
                    width: 250,
                    image: AssetImage("assets/images/compass-top.png")),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.w800),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText('Hi Chris'),
                          !(authData.toString() == 'null')
                              ? WavyAnimatedText(
                                  authData['username'].toString())
                              : WavyAnimatedText("No name"),

                          //   WavyAnimatedText('Welcome'),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ),
                  ],
                ),
              ),
              const HorizontalSpace(),
              const Text(
                "what do you want to do today?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    letterSpacing: 0.02,
                    wordSpacing: .05),
              ),
              const HorizontalSpace(),
              const HorizontalSpace(),
              const Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  HomeNavBody(
                    bodyText: 'the the the the the the the the the the the the',
                    color: Color(0xFFDAD5F4),
                    headText: 'Read Bible',
                    icon: Icon(Icons.ac_unit),
                  ),
                  HomeNavBody(
                    bodyText: 'the the the the the the the the the the the the',
                    color: Color(0xFFEBF6D3),
                    headText: 'Read Bible',
                    icon: Icon(Icons.ac_unit),
                  ),
                  HomeNavBody(
                    bodyText: 'the the the the the the the the the the the the',
                    color: Color(0xFFF4F9F6),
                    headText: 'Read Bible',
                    icon: Icon(Icons.ac_unit),
                  ),
                  HomeNavBody(
                    bodyText: 'the the the the the the the the the the the the',
                    color: Color(0xFFF4F9F6),
                    headText: 'Read Bible',
                    icon: Icon(Icons.ac_unit),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ClayContainer(
                  height: 300,
                  borderRadius: 30,
                  child: FutureBuilder<FavoriteState>(
                    future: favsfuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<FavoriteState> snapshot) {
                      if (snapshot.hasData) {
                        // debugPrint(snapshot.data?.data['data'].toString());
                        final fulldata = snapshot.data?.data['data'];
                        // debugPrint(fulldata.toString());
                        return ListView.builder(
                          itemCount: fulldata.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                fulldata[index]['keyword'],
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 25),
                              ),
                              trailing: IconButton(
                                onPressed: () async {
                                  // debugPrint(fulldata[index]['keyword']);
                                  context.go("/verse/${fulldata[index]['id']}");
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              ),
                              // contentPadding: const EdgeInsets.symmetric(
                              //     horizontal: 16.0, vertical: 20),
                              enabled: true,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeNavBody extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String headText;
  final String bodyText;
  final void Function()? onTap;
  const HomeNavBody({
    super.key,
    required this.color,
    required this.icon,
    required this.headText,
    required this.bodyText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        color: color,
        height: 150,
        width: 150,
        emboss: true,
        borderRadius: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                headText,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                bodyText,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
