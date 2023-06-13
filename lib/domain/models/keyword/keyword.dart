import 'package:bible_compass_app/domain/models/verse/verse.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'keyword.freezed.dart';
part 'keyword.g.dart';

@freezed
class KeywordModel with _$KeywordModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake, // <---
  )
  factory KeywordModel({
    @Default('') String keywordId,
    @Default('') String categoryId,
    @Default('') String keyword,
    @Default(false) bool forSubscribers,
    @Default([]) List<VerseModel> bibleVerse,
    @Default(0) int dateCreated,
    @Default(0) int dateUpdated,
    @Default(false) bool favorite,

    // Add other necessary fields
  }) = _KeywordModel;

  factory KeywordModel.fromJson(Map<String, dynamic> json) =>
      _$KeywordModelFromJson(json);
}

@freezed
abstract class KeywordState with _$KeywordState {
  const factory KeywordState(
      {@Default({}) Map<String, dynamic> data,
      @Default(false) bool isLoading,
      @Default('') String error,
      @Default(false) bool isLoggedIn}) = _KeywordState;

  // const KeywordState._();
}
