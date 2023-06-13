import 'package:bible_compass_app/data/remote/verserequest.dart';
import 'package:bible_compass_app/domain/models/verse/verse.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verseProvider =
    StateNotifierProvider.autoDispose<VerseNotifier, VerseState>((ref) {
  return VerseNotifier();
});
