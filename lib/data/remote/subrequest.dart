import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:bible_compass_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubNotifier extends StateNotifier<SubscriptionState> {
  SubNotifier() : super(const SubscriptionState());

  Future<void> perfromCreateSubRequest(dynamic ref, String userId) async {
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
          EnvironmentSubConfig.adminCreateSubscriptionUrl + userId,
          data: ref);
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

  Future<void> perfromUpdateSubRequest(dynamic data, String id) async {
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
          EnvironmentSubConfig.adminUpdateSubscriptionUrl + id,
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

  Future<SubscriptionState> perfromGetSubsRequest({String search = ''}) async {
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
          "${EnvironmentSubConfig.adminGetSubscriptionsUrl}?username=$search&type=$search");
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

  Future<SubscriptionState> perfromGetUserSubsRequests(String id,
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
          await dio.get(EnvironmentSubConfig.adminGetUserSubscriptions + id);
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

  Future<SubscriptionState> perfromGetSingleSubRequest(String id) async {
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
          await dio.get(EnvironmentSubConfig.adminGetSubscriptionByIdUrl + id);
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

  Future<SubscriptionState> performDeleteSubRequest(String id) async {
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
          .delete(EnvironmentSubConfig.adminDeleteSubscriptionByIdUrl + id);
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

  Future<SubscriptionState> perfromGetSubStats() async {
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
          await dio.get(EnvironmentSubConfig.adminGetSubscriptionInfoUrl);
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

  Future<SubscriptionState> perfromGetUserSubStats(String userId) async {
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
          .get(EnvironmentSubConfig.adminGetUserSubscriptionsStats + userId);
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
