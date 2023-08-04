import 'package:bible_compass_app/domain/models/favourites/favorite.dart';
import 'package:bible_compass_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier() : super(const FavoriteState());

  Future<FavoriteState> perfromLikeRequest(String keyword, String email) async {
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
      final response = await dio
          .get("${EnvironmentFavConfig.userLikeKeyword}$keyword/$email");
      dio.close();
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
    return state;
  }

  Future<FavoriteState> perfromUnLikeRequest(
      String keyword, String email) async {
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
      final response = await dio
          .get("${EnvironmentFavConfig.userUnlikeKeyword}$keyword/$email");
      dio.close();
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
    return state;
  }

  Future<FavoriteState> perfromGetStatusRequest(
      String keyword, String email) async {
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
      final Response<dynamic> response;
      // dio.re
      response = await dio.get(
        "${EnvironmentFavConfig.userGetFavStatus}$keyword/${email.trim()}",
      );
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));

      dio.close();
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
    return state;
  }

  Future<FavoriteState> perfromGetFavsRequest(String email) async {
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
      final response =
          await dio.get("${EnvironmentFavConfig.userGetKeywords}$email");
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
      dio.close();
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
    return state;
  }
}
