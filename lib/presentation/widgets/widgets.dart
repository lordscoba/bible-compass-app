import 'package:flutter/material.dart';

class CompassTop extends StatelessWidget {
  final double? width;
  const CompassTop({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      image: const AssetImage("assets/images/compass-top.png"),
    );
  }
}

class CompassSide extends StatelessWidget {
  final double? width;
  const CompassSide({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      image: const AssetImage("assets/images/compass-side.png"),
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 15,
    );
  }
}
