import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default({}) Map<String, dynamic> data,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _FavoriteState;

  // const UserState._();
}
