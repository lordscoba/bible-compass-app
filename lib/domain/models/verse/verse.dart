import 'package:freezed_annotation/freezed_annotation.dart';

part 'verse.freezed.dart';
part 'verse.g.dart';

@freezed
class VerseModel with _$VerseModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake, // <---
  )
  factory VerseModel({
    String? id,
    @Default('') String bibleVerse,
    @Default([]) List relatedVerses,
    @Default('') String passage,
    @Default('') String explanation,
    @Default(false) bool like,
    DateTime? dateCreated,

    // Add other necessary fields
  }) = _VerseModel;

  factory VerseModel.fromJson(Map<String, dynamic> json) =>
      _$VerseModelFromJson(json);
}

@freezed
abstract class VerseState with _$VerseState {
  const factory VerseState(
      {@Default({}) Map<String, dynamic> data,
      @Default(false) bool isLoading,
      @Default('') String error,
      @Default(false) bool isLoggedIn}) = _VerseState;

  // const VerseState._();
}
