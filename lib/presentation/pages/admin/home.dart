import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/adminusersproviders.dart';
import 'package:bible_compass_app/presentation/pages/admin/categories/createcategory.dart';
import 'package:bible_compass_app/presentation/pages/admin/users/viewuser.dart';
import 'package:bible_compass_app/presentation/widgets/addsomething.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/tophome.dart';
import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminHeader(
        title: 'Admin Home',
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
              const TopHome(),
              const TopHomeDouble(),
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
              const AddSomething(
                text: 'View App Data',
                icon: Icons.arrow_forward_ios,
              ),
              const InnerClayList1()
            ],
          ),
        ),
      ),
    );
  }
}

class TopHomeDouble extends StatelessWidget {
  const TopHomeDouble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TopHomeDoubleChildren(
              icon: Icons.account_circle,
              text: 'Here you can manage the users database',
              title: 'Users Admin',
              onTap: () {
                context.push("/admin/users");
              },
            ),
            TopHomeDoubleChildren(
              icon: Icons.data_object,
              text: 'Here you can extensively manage Bible Compass data',
              title: 'Data Admin',
              onTap: () {
                context.push("/admin/categories");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TopHomeDoubleChildren extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const TopHomeDoubleChildren({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        height: 200,
        width: (MediaQuery.of(context).size.width / 2) - 30,
        borderRadius: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  color: Colors.black54,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const HorizontalSpace(),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 4) + 20,
                      child: Text(text,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InnerClayList1 extends ConsumerWidget {
  const InnerClayList1({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final userscalled = ref
          .watch(adminUserProvider.notifier)
          .perfromGetUsersRequest(search: ref.watch(searchText));
      return userscalled;
    });
    double listSize = 450;
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
                      "New Users",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SearchTextUser1(),
                    SizedBox(
                      height: listSize,
                      child: FutureBuilder<UserState>(
                        future: usersfuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<UserState> snapshot) {
                          if (snapshot.hasData) {
                            // debugPrint(snapshot.data?.data['data'].toString());
                            final fulldata = snapshot.data?.data['data'];
                            return ListView.builder(
                              itemCount: fulldata.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(fulldata[index]['username']),
                                  subtitle: const Text("Not a registered user"),
                                  trailing: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return ViewUser(
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
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class SearchTextUser1 extends ConsumerWidget {
  const SearchTextUser1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchInputField(
      onChanged: (value) async {
        ref.read(searchText.notifier).state = value;
        await ref
            .refresh(adminUserProvider.notifier)
            .perfromGetUsersRequest(search: ref.watch(searchText));
      },
    );
  }
}
