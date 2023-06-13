import 'package:bible_compass_app/data/remote/keywordrequest.dart';
import 'package:bible_compass_app/domain/models/keyword/keyword.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final keywordProvider =
    StateNotifierProvider.autoDispose<KeywordNotifier, KeywordState>((ref) {
  return KeywordNotifier();
});
