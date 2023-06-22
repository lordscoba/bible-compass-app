import 'package:bible_compass_app/domain/models/favourites/favorite.dart';
import 'package:bible_compass_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier() : super(const FavoriteState());

  Future<FavoriteState> perfromLikeRequest(String keyword, String email) async {
    try {
      // Set loading state
      state = state.copyWith(isLoading: true, error: '');
      final dio = Dio();

      // Make the POST request
      final response = await dio
          .get("${EnvironmentFavConfig.userLikeKeyword}$keyword/$email");
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        state = state.copyWith(
            isLoading: false,
            data: response.data as Map<String, dynamic>,
            error: '');
        debugPrint(response.data.toString());
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

      // Make the POST request
      final response = await dio
          .get("${EnvironmentFavConfig.userUnlikeKeyword}$keyword/$email");
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        state = state.copyWith(
            isLoading: false,
            data: response.data as Map<String, dynamic>,
            error: '');
        debugPrint(response.data.toString());
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
      // debugPrint(keyword);
      // debugPrint(email);
      // debugPrint(
      //     "${EnvironmentFavConfig.userGetFavStatus}$keyword/${email.trim()}");

      // Make the POST request
      final response = await dio.get(
          "${EnvironmentFavConfig.userGetFavStatus}$keyword/${email.trim()}");
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

      // Make the POST request
      final response =
          await dio.get("${EnvironmentFavConfig.userGetKeywords}$email");
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        state = state.copyWith(
            isLoading: false,
            data: response.data as Map<String, dynamic>,
            error: '');
        debugPrint(response.data.toString());
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
