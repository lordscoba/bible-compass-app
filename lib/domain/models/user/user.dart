import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {@Default('') String name,
      @Default('') String username,
      @Default('') String password,
      @Default('') String email,
      @Default('') String key
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

// @freezed
// abstract class AsyncValue<T> {
//   const factory AsyncValue.data(T value) = AsyncData<T>;
//   const factory AsyncValue.loading() = AsyncLoading<T>;
//   const factory AsyncValue.error(Object error, {StackTrace? stackTrace}) =
//       AsyncError<T>;
// }
