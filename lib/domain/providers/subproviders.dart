import 'package:bible_compass_app/data/remote/subrequest.dart';
import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subProvider =
    StateNotifierProvider.autoDispose<SubNotifier, SubscriptionState>((ref) {
  return SubNotifier();
});
