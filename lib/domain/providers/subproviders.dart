import 'package:bible_compass_app/data/remote/subrequest.dart';
import 'package:bible_compass_app/domain/models/subscription/subscription.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final successSubMessageProvider =
    StateProvider.autoDispose<String>((ref) => "");
final errorSubMessageProvider = StateProvider.autoDispose<String>((ref) => "");

final subProvider =
    StateNotifierProvider.autoDispose<SubNotifier, SubscriptionState>((ref) {
  return SubNotifier();
});

final paystackProvider =
    StateNotifierProvider<SubNotifier, SubscriptionState>((ref) {
  return SubNotifier();
});
