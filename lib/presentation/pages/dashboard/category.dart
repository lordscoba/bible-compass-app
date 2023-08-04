import 'package:bible_compass_app/domain/models/category/category.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/domain/providers/categoryproviders.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/utils/snacksbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  @override
  void initState() {
    super.initState();
    // Call the showDialog method when the page is entered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Welcome to Catgeory page'),
          content: const Text('The dark green catgeories are for premium plan'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final catsfuture =
        Future.delayed(const Duration(milliseconds: 200), () async {
      final CategoryState catscalled;
      if (ref.watch(categoryProvider).data.isNotEmpty) {
        catscalled = ref.watch(categoryProvider);
        return catscalled;
      } else {
        catscalled = await ref
            .watch(categoryProvider.notifier)
            .perfromGetCatgeoriesRequest();
        return catscalled;
      }
    });
    final AuthState auth = ref.watch(loginProvider);
    var authData = auth.data['data'];
    // debugPrint(authData.toString());
    return Scaffold(
      appBar: const Header(
        title: 'Categories',
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
              // image: AssetImage("assets/images/wallpaper1.jpeg"),
              image: AssetImage("assets/images/holy.jpg"),
              fit: BoxFit.cover),
        ),
        height: double.infinity,
        // height: 1200,
        width: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 80,
            child: FutureBuilder<CategoryState>(
              future: catsfuture,
              builder: (BuildContext context,
                  AsyncSnapshot<CategoryState> snapshot) {
                if (snapshot.hasData) {
                  // debugPrint(snapshot.data?.data['data'].toString());
                  final fulldata = snapshot.data?.data['data'] ?? '';

                  if (fulldata.isNotEmpty) {
                    return ListView.builder(
                      itemCount: fulldata.length,
                      itemBuilder: (context, index) {
                        return FadeIn(
                          duration: Duration(milliseconds: 300 + (400 * index)),
                          curve: Curves.slowMiddle,
                          child: GestureDetector(
                            onTap: () {
                              if (fulldata[index]['for_subscribers'] == true) {
                                if (authData['upgrade'] == true) {
                                  context.push(
                                      "/keywords/${fulldata[index]['id']}");
                                } else {
                                  showSnackBar(context,
                                      "You are not subscribed, Please Upgrade to use");
                                }
                              } else {
                                context
                                    .push("/keywords/${fulldata[index]['id']}");
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                gradient: fulldata[index]['for_subscribers']
                                    ? const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromARGB(255, 4, 82, 64),
                                          Color.fromARGB(255, 4, 44, 31),
                                          Color.fromARGB(255, 3, 47, 34),
                                        ],
                                      )
                                    : const LinearGradient(
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
                                  fulldata[index]['category_name'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 20),
                                enabled: true,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: const Center(
                          child: Text(
                            "switch on your internet",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
