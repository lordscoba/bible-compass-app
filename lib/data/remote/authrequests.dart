import 'dart:convert';

import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:bible_compass_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpNotifier extends StateNotifier<UserState> {
  SignUpNotifier() : super(const UserState());

  Future<void> perfromSignupRequest(ref) async {
    try {
      // Set loading state
      state = state.copyWith(isLoading: true, error: '');
      final dio = Dio();

      // Make the POST request
      final response =
          await dio.post(EnvironmentUserConfig.signUpUrl, data: ref);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        state = state.copyWith(
            isLoading: false,
            data: response.data as Map<String, dynamic>,
            error: '');
        // debugPrint(response.data.toString());
      }
    } on DioException catch (e) {
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
  }

  Future<void> perfromVerifyUserRequest(ref) async {
    try {
      // Set loading state
      state = state.copyWith(isLoading: true, error: '');
      final dio = Dio();

      // Make the POST request
      final response =
          await dio.post(EnvironmentUserConfig.verifyUpUrl, data: ref);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        state = state.copyWith(
            isLoading: false,
            data: response.data as Map<String, dynamic>,
            error: '');
        // debugPrint(response.data.toString());
      }
    } on DioException catch (e) {
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
  }
}

class LoginNotifier extends StateNotifier<AuthState> {
  LoginNotifier() : super(const AuthState());
  Future<void> performLogin(ref) async {
    try {
      // Set loading state
      state = state.copyWith(isLoading: true, error: '');
      final dio = Dio();

      // Make the POST request
      final response =
          await dio.post(EnvironmentUserConfig.loginUpUrl, data: ref);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        state = state.copyWith(
            isLoading: false,
            data: response.data as Map<String, dynamic>,
            error: '');
        // debugPrint(response.data['data'].toString());

        // set login state
        // final prefs = await ref.watch(sharedPrefProvider);
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        String detailsstring = jsonEncode(response.data);

        await prefs.setString('details', detailsstring);
        await prefs.setString(
            'email', response.data['data']['email'].toString());
        await prefs.setString(
            'username', response.data['data']['username'].toString());
        await prefs.setString('type', response.data['data']['type'].toString());
        await prefs.setString(
            'token', response.data['data']['token'].toString());
        await prefs.setString(
            'token_type', response.data['data']['token_type'].toString());
        await prefs.setBool('status', true);

        // end set login state
      }
    } on DioException catch (e) {
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
  }

  Future<void> performgetUser(String id) async {
    try {
      // Set loading state
      state = state.copyWith(isLoading: true, error: '');
      final dio = Dio();

      // decode header
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      bool hasExpired = JwtDecoder.isExpired(token!);
      if (!hasExpired) {
        dio.options.headers["bearer"] = token.toString();
      } else {
        state = state.copyWith(isLoading: false, error: "token has expired");
      }
      //end decode header

      // Make the POST request
      final response = await dio.get(
        EnvironmentUserConfig.getProfileByIdUrl + id,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        state = state.copyWith(
            isLoading: false,
            data: response.data as Map<String, dynamic>,
            error: '');
        // debugPrint(response.data.toString());
      }
    } on DioException catch (e) {
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
  }
}
