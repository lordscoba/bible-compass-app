import 'package:bible_compass_app/domain/models/category/category.dart';
import 'package:bible_compass_app/domain/providers/adminusersproviders.dart';
import 'package:bible_compass_app/domain/providers/categoryproviders.dart';
import 'package:bible_compass_app/presentation/pages/admin/categories/createcategory.dart';
import 'package:bible_compass_app/presentation/pages/admin/categories/deletecategory.dart';
import 'package:bible_compass_app/presentation/pages/admin/categories/updatecategory.dart';
import 'package:bible_compass_app/presentation/pages/admin/categories/viewcategory.dart';
import 'package:bible_compass_app/presentation/widgets/addsomething.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/tophome.dart';

class AdminCategory extends StatelessWidget {
  const AdminCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminHeader(
        title: 'Admin Categories',
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
              const TopHomeCategory(),
              AddSomething(
                text: 'Want to add Category?',
                icon: Icons.add_circle_outline,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return const CreateCategory();
                    },
                  );
                },
              ),
              const InnerClayListCategory()
            ],
          ),
        ),
      ),
    );
  }
}

class TopHomeCategory extends ConsumerWidget {
  const TopHomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final statscalled =
          ref.watch(categoryProvider.notifier).perfromGetCategoryStats();
      return statscalled;
    });
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Align(
        alignment: Alignment.center,
        child: ClayContainer(
          height: 180,
          width: MediaQuery.of(context).size.width - 30,
          borderRadius: 20,
          child: FutureBuilder<CategoryState>(
            future: statsfuture,
            builder:
                (BuildContext context, AsyncSnapshot<CategoryState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final fulldata = snapshot.data?.data['data'];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TopHomeChildren(
                      icons: Icons.category_rounded,
                      title: 'Total cat',
                      total: fulldata['total_category'].toString(),
                    ),
                    TopHomeChildren(
                      icons: Icons.category_outlined,
                      title: 'Subed cat',
                      total: fulldata['subscribers_category'].toString(),
                    ),
                    TopHomeChildren(
                      icons: Icons.category_outlined,
                      title: 'Unsubed Upgrades',
                      total: fulldata['total_keywords'].toString(),
                    ),
                  ],
                );

                // return const Text("hello hasdata");
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

class InnerClayListCategory extends ConsumerWidget {
  const InnerClayListCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catsfuture = Future.delayed(const Duration(milliseconds: 10), () {
      final catscalled = ref
          .watch(categoryProvider.notifier)
          .perfromGetCatgeoriesRequest(search: ref.watch(searchText));
      return catscalled;
    });
    double listSize = 350;
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
                      "Categories",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SearchTextCategory(),
                    SizedBox(
                      height: listSize - 50,
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
                                return ListTile(
                                  title: Text(fulldata[index]['category_name']),
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
                                              return UpdateCategory(
                                                catId: fulldata[index]['id'],
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
                                              return DeleteModalCategory(
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
                                              return ViewCategory(
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
                                              "/admin/keywords/${fulldata[index]['id']}");
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
                            return const Center(
                              child: CupertinoActivityIndicator(
                                radius: 50,
                              ),
                            );
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

class SearchTextCategory extends ConsumerWidget {
  const SearchTextCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchInputField(
      onChanged: (value) async {
        ref.read(searchText.notifier).state = value;
        await ref
            .refresh(categoryProvider.notifier)
            .perfromGetCatgeoriesRequest(search: ref.watch(searchText));
      },
    );
  }
}
