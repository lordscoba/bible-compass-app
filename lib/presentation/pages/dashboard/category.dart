import 'package:bible_compass_app/domain/models/category/category.dart';
import 'package:bible_compass_app/domain/providers/categoryproviders.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends ConsumerWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catsfuture = Future.delayed(const Duration(milliseconds: 200), () {
      final catscalled =
          ref.watch(categoryProvider.notifier).perfromGetCatgeoriesRequest();
      return catscalled;
    });
    return Scaffold(
      // extendBodyBehindAppBar: true,
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
              image: AssetImage("assets/images/wallpaper1.jpeg"),
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
                  final fulldata = snapshot.data?.data['data'];
                  return ListView.builder(
                    itemCount: fulldata.length,
                    itemBuilder: (context, index) {
                      return FadeIn(
                        duration: Duration(milliseconds: 300 + (400 * index)),
                        curve: Curves.slowMiddle,
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
                              fulldata[index]['category_name'],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                context
                                    .push("/keywords/${fulldata[index]['id']}");
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 20),
                            enabled: true,
                          ),
                        ),
                      );
                    },
                  );

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
