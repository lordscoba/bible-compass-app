import 'package:bible_compass_app/presentation/pages/admin/categories/createcategory.dart';
import 'package:bible_compass_app/presentation/pages/admin/categories/updatecategory.dart';
import 'package:bible_compass_app/presentation/pages/admin/categories/viewcategory.dart';
import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/addsomething.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
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

class TopHomeCategory extends StatelessWidget {
  const TopHomeCategory({
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
                title: 'Total cat',
                total: '86',
              ),
              TopHomeChildren(
                icons: Icons.category_outlined,
                title: 'Subed cat',
                total: '8',
              ),
              TopHomeChildren(
                icons: Icons.category_outlined,
                title: 'Unsubed Upgrades',
                total: '20',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InnerClayListCategory extends StatelessWidget {
  const InnerClayListCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      "Categories",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(
                      height: listSize - 50,
                      child: ListView(
                        // physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ListTile(
                            title: const Text("Spirituality"),
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
                                        return const UpdateCategory();
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
                                        return const UpdateCategory();
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
                                        return const ViewCategory();
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
