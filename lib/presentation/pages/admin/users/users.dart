import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/adminusersproviders.dart';
import 'package:bible_compass_app/presentation/pages/admin/users/createuser.dart';
import 'package:bible_compass_app/presentation/pages/admin/users/deleteuser.dart';
import 'package:bible_compass_app/presentation/pages/admin/users/updateuser.dart';
import 'package:bible_compass_app/presentation/pages/admin/users/viewuser.dart';
import 'package:bible_compass_app/presentation/widgets/addsomething.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/inputfield.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/tophome.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AdminUsers extends StatelessWidget {
  const AdminUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminHeader(
        title: 'Admin Users',
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
              const TopHomeUsers(),
              AddSomething(
                text: 'Want to add User?',
                icon: Icons.add_circle_outline,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return const CreateUsers();
                    },
                  );
                },
              ),
              const InnerClayListUser()
            ],
          ),
        ),
      ),
    );
  }
}

class TopHomeUsers extends ConsumerWidget {
  const TopHomeUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsfuture = Future.delayed(const Duration(milliseconds: 100), () {
      final statscalled =
          ref.watch(adminUserProvider.notifier).perfromGetUserStats();
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
          child: FutureBuilder<UserState>(
            future: statsfuture,
            builder: (BuildContext context, AsyncSnapshot<UserState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final fulldata = snapshot.data?.data['data'];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TopHomeChildren(
                      icons: Icons.category_rounded,
                      title: 'Total users',
                      total: fulldata['total_users'].toString(),
                    ),
                    TopHomeChildren(
                      icons: Icons.category_outlined,
                      title: 'Subed users',
                      total: fulldata['subscribed_users'].toString(),
                    ),
                    TopHomeChildren(
                      icons: Icons.category_outlined,
                      title: 'Verified users',
                      total: fulldata['verified_users'].toString(),
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

class TopHomeChildrenCategory extends StatelessWidget {
  final String title;
  final String total;
  final IconData icons;

  // const TopHomeChildrenCategory({super.key});
  const TopHomeChildrenCategory({
    super.key,
    required this.title,
    required this.total,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            // Icons.account_circle,
            icons, size: 55,
            color: Colors.black54,
          ),
          Text(title),
          Text(
            total,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black54),
          )
        ],
      ),
    );
  }
}

class InnerClayListUser extends ConsumerWidget {
  const InnerClayListUser({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersfuture = Future.delayed(const Duration(milliseconds: 50), () {
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
                      "Users",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SearchTextUser(),
                    SizedBox(
                      height: listSize - 50,
                      child: FutureBuilder<UserState>(
                        future: usersfuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<UserState> snapshot) {
                          if (snapshot.hasData) {
                            // debugPrint(snapshot.data?.data['data'].toString());
                            final dynamic fulldata =
                                snapshot.data?.data['data'];
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: fulldata.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(fulldata[index]['username']),
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
                                              return UpdateUsers(
                                                  fulldata[index]['id']);
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 20,
                                        ),
                                        tooltip: "edit",
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return DeleteModal(
                                                fulldata[index]['id'],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 20,
                                        ),
                                        tooltip: "delete",
                                      ),
                                      IconButton(
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
                                        tooltip: "show",
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

class SearchTextUser extends ConsumerWidget {
  const SearchTextUser({super.key});

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
