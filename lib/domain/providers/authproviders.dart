import 'package:bible_compass_app/data/remote/authrequests.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final successMessageProvider = StateProvider.autoDispose<String>((ref) => "");
final errorMessageProvider = StateProvider.autoDispose<String>((ref) => "");

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, UserState>((ref) {
  return SignUpNotifier();
});

final loginProvider = StateNotifierProvider<LoginNotifier, AuthState>((ref) {
  return LoginNotifier();
});

// final logoutProvider = StateNotifierProvider<LoginNotifier, AuthState>((ref) {
//   ref.read(loginProvider.notifier).dispose();
//   return LoginNotifier();
// });

final sharedPrefProvider = Provider((_) async {
  return await SharedPreferences.getInstance();
});
