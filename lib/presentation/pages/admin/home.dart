import 'package:bible_compass_app/presentation/widgets/Header.dart';
import 'package:bible_compass_app/presentation/widgets/addsomething.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:bible_compass_app/presentation/widgets/tophome.dart';
import 'package:bible_compass_app/presentation/widgets/tophomedouble.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
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
      body: const SizedBox(
        height: 1200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopHome(),
              TopHomeDouble(),
              AddSomething(
                text: 'Want to add Category?',
                icon: Icons.add_circle_outline,
              ),
              AddSomething(
                text: 'View App Data',
                icon: Icons.arrow_forward_ios,
              ),
              InnerClayList1()
            ],
          ),
        ),
      ),
    );
  }
}

class InnerClayList1 extends StatelessWidget {
  const InnerClayList1({
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
                      "New Users",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(
                      height: listSize - 50,
                      child: ListView(
                        // physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ListTile(
                            title: const Text("Nwokoye Chris"),
                            subtitle: const Text("Not a registered user"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )),
                          ),
                          ListTile(
                            title: const Text("Nwokoye Chris"),
                            subtitle: const Text("Not a registered user"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )),
                          ),
                          ListTile(
                            title: const Text("Nwokoye Chris"),
                            subtitle: const Text("Not a registered user"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )),
                          ),
                          ListTile(
                            title: const Text("Nwokoye Chris"),
                            subtitle: const Text("Not a registered user"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )),
                          ),
                          ListTile(
                            title: const Text("Nwokoye Chris"),
                            subtitle: const Text("Not a registered user"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )),
                          ),
                          ListTile(
                            title: const Text("Nwokoye Chris"),
                            subtitle: const Text("Not a registered user"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )),
                          )
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
