import 'package:bible_compass_app/data/remote/profilerequest.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider =
    StateNotifierProvider.autoDispose<ProfileNotifier, UserState>((ref) {
  return ProfileNotifier();
});
