import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake, // <---
  )
  factory CategoryModel(
      {@Default('') String categoryId,
      @Default('') String categoryName,
      @Default(false) bool forSubscribers,
      @Default('') String keywords,
      @Default(0) int dateCreated,
      @Default(0) int dateUpdated
      // Add other necessary fields
      }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
abstract class CategoryState with _$CategoryState {
  const factory CategoryState(
      {@Default({}) Map<String, dynamic> data,
      @Default(false) bool isLoading,
      @Default('') String error,
      @Default(false) bool isLoggedIn}) = _CatogoryState;

  // const UserState._();
}
