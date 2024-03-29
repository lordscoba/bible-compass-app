import 'package:avatar_glow/avatar_glow.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:bible_compass_app/presentation/pages/dashboard/editprofile.dart';
import 'package:bible_compass_app/presentation/widgets/drawer.dart';
import 'package:bible_compass_app/presentation/widgets/header.dart';
import 'package:bible_compass_app/presentation/widgets/navigations.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthState auth = ref.watch(loginProvider);
    var authData = auth.data['data'];
    return Scaffold(
      appBar: const Header(
        title: 'Profile',
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
      body: SizedBox(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage("assets/images/wallpaper1.jpeg"),
        //       fit: BoxFit.cover),
        // ),
        height: double.infinity,
        // height: 1200,
        width: double.infinity,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 80,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                ClayContainer(
                  borderRadius: 30,
                  width: MediaQuery.of(context).size.width - 30,
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AvatarGlow(
                        // elevation: 8.0,
                        glowColor: Colors.greenAccent,
                        // endRadius: 100.0,
                        duration: const Duration(milliseconds: 2000),
                        repeat: true,
                        // showTwoGlows: true,
                        // repeatPauseDuration: const Duration(milliseconds: 100),
                        child: const Image(
                          image: AssetImage(
                            "assets/images/avatar.png",
                          ),
                          width: 120,
                          color: Color(0xFF0BA37F),
                          colorBlendMode: BlendMode.srcIn,
                        ),
                      ),
                      // const ,
                      !(authData.toString() == 'null')
                          ? Text(
                              "@${authData['username']}",
                              style: const TextStyle(color: Colors.black54),
                            )
                          : const Text("none"),
                      !(authData.toString() == 'null')
                          ? SizedBox(
                              width: 200,
                              child: Text(
                                authData['name'].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : const Text("none"),
                      const SizedBox(
                        height: 10,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            !(authData.toString() == 'null')
                                ? Text(
                                    authData['username'].toString(),
                                    style: const TextStyle(
                                        color: Color(0xFF0BA37F)),
                                  )
                                : const Text("none"),
                            const VerticalDivider(
                              color: Colors.black54,
                            ),
                            !(authData.toString() == 'null')
                                ? Text(
                                    DateFormat('yyyy-MM-dd').format(
                                      DateTime.parse(authData['last_login']),
                                    ),
                                    style:
                                        const TextStyle(color: Colors.black54),
                                  )
                                : const Text("none"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClayContainer(
                    borderRadius: 30,
                    width: MediaQuery.of(context).size.width - 30,
                    height: 400,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 60),
                      children: [
                        ListTile(
                          title: const Text(
                            "Information",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    // debugPrint(authData['id'].toString());
                                    return UpdateProfile(
                                      authData['id'].toString(),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.edit)),
                        ),
                        ListTile(
                          leading: const Icon(Icons.mail),
                          title: const Text(
                            "Email",
                            style: TextStyle(color: Colors.black45),
                          ),
                          trailing: !(authData.toString() == 'null')
                              ? Text(authData['email'].toString())
                              : const Text("none"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.account_circle_outlined),
                          title: const Text(
                            "Name",
                            style: TextStyle(color: Colors.black45),
                          ),
                          trailing: !(authData.toString() == 'null')
                              ? SizedBox(
                                  width: 100,
                                  child: Text(authData['name'].toString()))
                              : const Text("none"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.account_circle_outlined),
                          title: const Text(
                            "Username",
                            style: TextStyle(color: Colors.black45),
                          ),
                          trailing: !(authData.toString() == 'null')
                              ? Text(authData['username'].toString())
                              : const Text("none"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.calendar_month),
                          title: const Text(
                            "Joined",
                            style: TextStyle(color: Colors.black45),
                          ),
                          trailing: !(authData.toString() == 'null')
                              ? Text(DateFormat('yyyy-MM-dd').format(
                                  DateTime.parse(authData['last_login']),
                                ))
                              : const Text("none"),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
