import 'package:bible_compass_app/domain/models/verse/verse.dart';
import 'package:bible_compass_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerseNotifier extends StateNotifier<VerseState> {
  VerseNotifier() : super(const VerseState());

  Future<void> perfromCreateVerseRequest(String keywId, dynamic ref) async {
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
          .post(EnvironmentVerseConfig.adminCreateVerseUrl + keywId, data: ref);
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

  Future<void> perfromUpdateVerseRequest(
      String keywId, dynamic data, String vsId) async {
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
      final response = await dio.patch(
          "${EnvironmentVerseConfig.adminUpdateVerseByIdUrl}$keywId/$vsId",
          data: data);
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

  Future<VerseState> perfromGetVersesRequest(String keywId,
      {String search = ''}) async {
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
          await dio.get(EnvironmentVerseConfig.adminGetVersesUrl + keywId);
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

  Future<VerseState> perfromGetSingleVerseRequest(
      String keywId, String vsId) async {
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
          .get("${EnvironmentVerseConfig.adminGetVerseByIdUrl}$keywId/$vsId");
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

  Future<VerseState> performDeleteVerseRequest(
      String keywId, String vsId) async {
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
      final response = await dio.delete(
          '${EnvironmentVerseConfig.adminDeleteVerseByIdUrl}$keywId/$vsId');
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

  Future<VerseState> perfromGetVerseStats(String verseId) async {
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
          await dio.get(EnvironmentVerseConfig.adminGetVerseInfoUrl + verseId);
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
