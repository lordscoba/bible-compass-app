import 'package:bible_compass_app/data/remote/authrequests.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final successMessageProvider = StateProvider.autoDispose<String>((ref) => "");
final errorMessageProvider = StateProvider.autoDispose<String>((ref) => "");

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, UserState>((ref) {
  return SignUpNotifier();
});

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, UserState>((ref) {
  return LoginNotifier();
});
