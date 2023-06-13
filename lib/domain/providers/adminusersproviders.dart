import 'package:bible_compass_app/data/remote/adminuserrequest.dart';
import 'package:bible_compass_app/domain/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminUserProvider =
    StateNotifierProvider.autoDispose<AdminUserNotifier, UserState>((ref) {
  return AdminUserNotifier();
});
