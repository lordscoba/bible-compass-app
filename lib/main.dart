import 'package:bible_compass_app/config/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyRouter()));
}

// I am leaving this here
//You are suprised this small code made this app right