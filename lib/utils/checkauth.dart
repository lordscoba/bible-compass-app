import 'dart:convert';

import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/domain/providers/authproviders.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// void checkAuth(dynamic ref, UserModel user) async {
//   final prefs = await ref.watch(sharedPrefProvider);

//   // get token
//   final String token = prefs.getString('token') ?? '';

//   //check if token has expired
//   bool hasExpired = false;
//   if (token.isNotEmpty) {
//     hasExpired = JwtDecoder.isExpired(token);
//   }
//   // check if its authenticated
//   if (!hasExpired && token.isNotEmpty) {
//     ref.watch(isAuthenticated.notifier).state = true;
//   } else {
//     ref.watch(isAuthenticated.notifier).state = false;
//   }

//   // perform login if its not authenticated
//   final String password = prefs.getString('password') ?? '';
//   final String email = prefs.getString('email') ?? '';

//   if (email.isNotEmpty && password.isNotEmpty) {
//     user = user.copyWith(email: email);
//     user = user.copyWith(password: password);
//     // debugPrint(password);
//     // debugPrint(email);

//     Future.delayed(const Duration(milliseconds: 500), () async {
//       await ref.read(loginProvider.notifier).performLogin(user.toJson());
//     });
//   }
// }

void checkAuth(dynamic ref, UserModel user, AuthState userstate) async {
  final prefs = await ref.watch(sharedPrefProvider);

  // get token
  final String token = prefs.getString('token') ?? '';

  //check if token has expired
  bool hasExpired = false;
  if (token.isNotEmpty) {
    hasExpired = JwtDecoder.isExpired(token);
  }
  // check if its authenticated
  if (!hasExpired && token.isNotEmpty) {
    ref.watch(isAuthenticated.notifier).state = true;
    // ref.watch(loginProvider.notifier).state = true;
    final String details = prefs.getString('details') ?? '';
    Map<String, dynamic> details1 = jsonDecode(details);

    ref.read(loginProvider.notifier).state =
        userstate.copyWith(isLoading: false, data: details1, error: '');
  } else if (hasExpired && token.isNotEmpty) {
    ref.watch(isAuthenticated.notifier).state = true;
    // perform login if its not authenticated
    final String password = prefs.getString('password') ?? '';
    final String email = prefs.getString('email') ?? '';
    if (email.isNotEmpty && password.isNotEmpty) {
      user = user.copyWith(email: email);
      user = user.copyWith(password: password);

      Future.delayed(const Duration(milliseconds: 500), () async {
        await ref.read(loginProvider.notifier).performLogin(user.toJson());
      });
    }
  } else {
    ref.watch(isAuthenticated.notifier).state = false;
  }
}
