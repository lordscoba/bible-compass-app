// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerseModel _$$_VerseModelFromJson(Map<String, dynamic> json) =>
    _$_VerseModel(
      verseId: json['verse_id'] as String? ?? '',
      bibleVerse: json['bible_verse'] as String? ?? '',
      relatedVerses: json['related_verses'] as List<dynamic>? ?? const [],
      passage: json['passage'] as String? ?? '',
      explanation: json['explanation'] as String? ?? '',
      like: json['like'] as bool? ?? false,
      dateCreated: (json['date_created'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_VerseModelToJson(_$_VerseModel instance) =>
    <String, dynamic>{
      'verse_id': instance.verseId,
      'bible_verse': instance.bibleVerse,
      'related_verses': instance.relatedVerses,
      'passage': instance.passage,
      'explanation': instance.explanation,
      'like': instance.like,
      'date_created': instance.dateCreated,
    };
