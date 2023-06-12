import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class InnerClayList extends StatelessWidget {
  const InnerClayList({
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
