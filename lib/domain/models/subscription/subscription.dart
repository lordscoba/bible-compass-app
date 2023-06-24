import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

@freezed
class SubscriptionModel with _$SubscriptionModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake, // <---
  )
  factory SubscriptionModel({
    String? id,
    @Default('') String userId,
    @Default('') String username,
    @Default('') String type,
    @Default(0) double amount,
    @Default(false) bool status,
    Duration? duration,
    DateTime? dateCreated,
    DateTime? dateExpiring,
    DateTime? dateUpdated,

    // Add other necessary fields
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
}

@freezed
abstract class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState(
      {@Default({}) Map<String, dynamic> data,
      @Default(false) bool isLoading,
      @Default('') String error,
      @Default(false) bool isLoggedIn}) = _SubscriptionState;

  // const SubscriptionState._();
}
