import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bible_compass_app/domain/models/favourites/favorite.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/favproviders.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthState auth = ref.watch(loginProvider);
    var authData = auth.data['data'];

    final favsfuture =
        Future.delayed(const Duration(milliseconds: 100), () async {
      final favscalled = await ref
          .watch(favProvider.notifier)
          .perfromGetFavsRequest(authData["email"]);
      return favscalled;
    });

    return Scaffold(
      appBar: const Header(
        title: 'Home',
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
      // backgroundColor: Colors.grey,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          // image: const DecorationImage(
          //     image: AssetImage("assets/images/get2.jpg"), fit: BoxFit.cover),
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
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
                          !(authData.toString() == 'null')
                              ? WavyAnimatedText("Hi ${authData['username']}")
                              : WavyAnimatedText("No name"),
                          WavyAnimatedText('Welcome'),
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
              Container(
                padding: const EdgeInsets.all(8),
                width: 350,
                child: const Text(
                  "With Bible Compass, you can search the categories and keywords for Related bible verses for your sermon topics, it also has other features like bookmarking your favorites keywords and online bible, which are made to ease your scripture navigation.",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      letterSpacing: 0.02,
                      wordSpacing: .05),
                ),
              ),
              const HorizontalSpace(),
              const HorizontalSpace(),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  HomeNavBody(
                    bodyText:
                        'In the category section check for the title to research on',
                    color: const Color(0xFFDAD5F4),
                    headText: 'Category',
                    icon: const Icon(Icons.category),
                    onTap: () {
                      context.push("/category");
                    },
                  ),
                  HomeNavBody(
                    bodyText:
                        'Check for the bookmarked bible keywords to use today!',
                    color: const Color(0xFFEBF6D3),
                    headText: 'Favorites',
                    icon: const Icon(Icons.favorite),
                    onTap: () {
                      context.push("/favorite");
                    },
                  ),
                  HomeNavBody(
                    bodyText: 'Go to your profile and check out your info',
                    color: const Color(0xFFF4F9F6),
                    headText: 'Profile',
                    icon: const Icon(Icons.ac_unit),
                    onTap: () {
                      context.push("/profile");
                    },
                  ),
                  HomeNavBody(
                    bodyText: 'Read the bible online',
                    color: const Color(0xFFF4F9F6),
                    headText: 'Read Bible',
                    icon: const Icon(Icons.book),
                    onTap: () {
                      context.push("/bible");
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ClayContainer(
                  height: 400,
                  borderRadius: 30,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          "Favorites",
                          style: GoogleFonts.crimsonText(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                      FutureBuilder<FavoriteState>(
                        future: favsfuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<FavoriteState> snapshot) {
                          if (snapshot.hasData) {
                            // debugPrint(snapshot.data.toString());
                            // debugPrint(snapshot.data?.data['data'].toString());
                            final dynamic fulldata =
                                snapshot.data?.data['data'] ?? '';

                            // debugPrint(fulldata.toString());

                            if (fulldata.isNotEmpty) {
                              return SizedBox(
                                height: 330,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 40),
                                  itemCount: fulldata.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          horizontalTitleGap: 20,
                                          title: Text(
                                            fulldata[index]['keyword'],
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 20),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () async {
                                              // debugPrint(fulldata[index]['keyword']);
                                              context.push(
                                                  "/verse/${fulldata[index]['id']}");
                                            },
                                            icon: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black87,
                                              size: 20,
                                            ),
                                          ),
                                          subtitle:
                                              const Text("Click to continue"),
                                          enabled: true,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Divider(
                                            color: Colors.grey
                                                .shade400, // Set the color of the divider line
                                            thickness:
                                                1, // Set the thickness of the divider line
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
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
                                        "ops! its either your internet is off or you have no favorite keywords",
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
                            // debugPrint(snapshot.error.toString());
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
                    ],
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
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Text(
                headText,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
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
