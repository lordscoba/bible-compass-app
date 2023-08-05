import 'package:bible_compass_app/domain/models/keyword/keyword.dart';
import 'package:bible_compass_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class KeywordNotifier extends StateNotifier<KeywordState> {
  // final ProviderReference ref;
  KeywordNotifier() : super(const KeywordState());

  Future<void> perfromCreateKeywordRequest(dynamic ref, String catId) async {
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
      final response = await dio.post(
          EnvironmentKeywordConfig.adminCreateKeywordUrl + catId,
          data: ref);
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
  }

  Future<void> perfromUpdateKeywordRequest(dynamic data, String id) async {
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
          EnvironmentKeywordConfig.adminUpdateKeywordUrl + id,
          data: data);
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
  }

  Future<KeywordState> perfromGetKeywordsRequest(String catId,
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
      final response = await dio.get(
          "${EnvironmentKeywordConfig.adminGetKeywordsUrl}$catId?keyword=$search");
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

  Future<KeywordState> perfromGetSingleKeywordRequest(String id) async {
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
          await dio.get(EnvironmentKeywordConfig.adminGetKeywordByIdUrl + id);
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

  Future<KeywordState> performDeleteKeywordRequest(String id) async {
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
          await dio.delete(EnvironmentKeywordConfig.adminDeleteKeywordUrl + id);
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

  Future<KeywordState> perfromGetKeywordStats() async {
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
          await dio.get(EnvironmentKeywordConfig.adminGetKeywordsInfoUrl);
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

final keywordApiProvider = FutureProvider.family
    .autoDispose<Map<String, dynamic>, Tuple2<String, String>>(
        (ref, tuple) async {
  // final dio = ref.watch(dioProvider);
  // return data;

  try {
    final dio = Dio();

    // decode header
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    bool hasExpired = JwtDecoder.isExpired(token!);
    if (!hasExpired) {
      dio.options.headers["bearer"] = token.toString();
    } else {
      throw Exception('token has expired');
    }
    //end decode header

    // final response = await dio.get(EnvironmentVerseConfig.aiBible + query);
    // Make the POST request
    final response = await dio.get(
        "${EnvironmentKeywordConfig.adminGetKeywordsUrl}${tuple.item1}?keyword=${tuple.item2}");
    dio.close();

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to fetch map data');
    }
  } on DioException catch (e) {
    if (e.response != null) {
      // debugPrint("hi1");
      debugPrint(e.response?.data.toString());
      return e.response?.data;
    } else {
      // debugPrint("hi2");
      debugPrint(e.message.toString());
      return throw Exception("Failed to fetch map data error: ${e.message}");
    }
  }

  // return response.data as Map<String, dynamic>;
});
