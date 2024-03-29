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
    String? id,
    @Default('') String name,
    @Default('') String type,
    @Default('') String username,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default('') String email,
    @Default('') String key,
    DateTime? dateCreated,
    DateTime? dateUpdated,
    @Default(false) bool isVerified,
    // Add other necessary fields
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class VerifyModel with _$VerifyModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake, // <---
  )
  factory VerifyModel({
    @Default('') String email,
  }) = _VerifyModel;

  factory VerifyModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyModelFromJson(json);
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState(
      {@Default({}) Map<String, dynamic> data,
      @Default(false) bool isLoading,
      @Default('') String error,
      @Default(false) bool isLoggedIn}) = _AuthState;
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
