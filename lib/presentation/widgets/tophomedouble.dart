import 'package:bible_compass_app/presentation/widgets/widgets.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class TopHomeDouble extends StatelessWidget {
  const TopHomeDouble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TopHomeDoubleChildren(),
            TopHomeDoubleChildren(),
          ],
        ),
      ),
    );
  }
}

class TopHomeDoubleChildren extends StatelessWidget {
  const TopHomeDoubleChildren({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
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
              const Icon(Icons.abc),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "My Users",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const HorizontalSpace(),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width / 4) + 20,
                    child:
                        const Text("lorem lorem lorem lorem lorem lorem lorem"),
                  ),
                  const Text("80"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
