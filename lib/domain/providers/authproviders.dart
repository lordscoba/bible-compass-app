import 'package:bible_compass_app/data/remote/authrequests.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(); // Customize with your Dio configuration
});

final successMessageProvider = StateProvider.autoDispose<String>((ref) => "");
final errorMessageProvider = StateProvider.autoDispose<String>((ref) => "");

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, UserState>((ref) {
  return SignUpNotifier();
});
