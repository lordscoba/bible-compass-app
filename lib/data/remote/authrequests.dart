import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpNotifier extends StateNotifier<UserState> {
  SignUpNotifier() : super(const UserState());

  Future<void> perfromSignupRequest(ref) async {
    try {
      // Set loading state
      state = state.copyWith(isLoading: true, error: '');
      final dio = Dio();

      // final dio = ref.watch(dioProvider);
      // Make the POST request
      final response = await dio.post(EnvironmentConfig.signUpUrl, data: ref);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        state = state.copyWith(
            isLoading: false,
            data: response.data as Map<String, dynamic>,
            error: '');
        // debugPrint(response.data.toString());
      }
    } on DioError catch (e) {
      // debugPrint(e.toString());
      if (e.response != null) {
        // debugPrint(e.response?.data['message'].toString());
        state = state.copyWith(
            isLoading: false, error: e.response?.data['message']);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message.toString());
        state = state.copyWith(isLoading: false, error: e.message.toString());
      }
    }

    // return state;
  }
}

// class SignUpNotifier extends StateNotifier<UserState> {
//   SignUpNotifier() : super(const UserState());




//   Future<void> perfromSignupRequest(ref) async {
//     try {
//       // Set loading state
//       state = state.copyWith(isLoading: true, error: '');
//       final dio = Dio();
// //       final dioProvider = Provider<Dio>((ref) {
// //   return Dio(); // Customize with your Dio configuration
// // });

//       // Make the POST request
//       final response = await dio.post(EnvironmentConfig.signUpUrl, data: ref);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         // Request successful
//         state = state.copyWith(
//             isLoading: false,
//             data: response.data as Map<String, dynamic>,
//             error: '');
//         // debugPrint(response.data.toString());
//       }
//     } on DioError catch (e) {
//       // debugPrint(e.toString());
//       if (e.response != null) {
//         // debugPrint(e.response?.data['message'].toString());
//         state = state.copyWith(
//             isLoading: false, error: e.response?.data['message']);
//       } else {
//         // Something happened in setting up or sending the request that triggered an Error
//         debugPrint(e.requestOptions.toString());
//         debugPrint(e.message.toString());
//         state = state.copyWith(isLoading: false, error: e.message.toString());
//       }
//     }

//     // return state;
//   }
// }
