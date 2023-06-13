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
    @Default('') String subscriptionId,
    @Default('') String userId,
    @Default('') String username,
    @Default('') String type,
    @Default(0) double amount,
    @Default(false) bool status,
    @Default(0) double duration,
    @Default(0) double dateCreated,
    @Default(0) double dateExpiring,
    @Default(0) double dateUpdated,

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
