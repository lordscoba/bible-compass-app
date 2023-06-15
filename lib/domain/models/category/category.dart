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
      {String? id,
      @Default('') String categoryName,
      @Default(false) bool forSubscribers,
      @Default([]) List<String> keywords,
      DateTime? dateCreated,
      DateTime? dateUpdated
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
