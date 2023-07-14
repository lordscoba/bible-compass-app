import 'package:bible_compass_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

final bibleApiProvider = FutureProvider.family
    .autoDispose<Map<String, dynamic>, String>((ref, query) async {
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

    final response = await dio.get(EnvironmentVerseConfig.aiBible + query);
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
