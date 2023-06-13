import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake, // <---
  )
  factory UserModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String type,
    @Default('') String username,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default('') String email,
    @Default('') String key,
    @Default(0) double dateCreated,
    @Default(0) double dateUpdated,
    @Default(false) bool isVerified,
    // Add other necessary fields
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class UserState with _$UserState {
  const factory UserState(
      {@Default({}) Map<String, dynamic> data,
      @Default(false) bool isLoading,
      @Default('') String error,
      @Default(false) bool isLoggedIn}) = _UserState;

  // const UserState._();
}
