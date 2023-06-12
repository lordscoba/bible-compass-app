import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class AddSomething extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final IconData icon;
  const AddSomething(
      {super.key, required this.text, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Align(
        alignment: Alignment.center,
        child: ClayContainer(
          height: 50,
          width: MediaQuery.of(context).size.width - 30,
          borderRadius: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      icon,
                      color: Colors.black54,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
