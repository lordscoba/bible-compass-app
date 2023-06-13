// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KeywordModel _$$_KeywordModelFromJson(Map<String, dynamic> json) =>
    _$_KeywordModel(
      keywordId: json['keyword_id'] as String? ?? '',
      categoryId: json['category_id'] as String? ?? '',
      keyword: json['keyword'] as String? ?? '',
      forSubscribers: json['for_subscribers'] as bool? ?? false,
      bibleVerse: (json['bible_verse'] as List<dynamic>?)
              ?.map((e) => VerseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dateCreated: json['date_created'] as int? ?? 0,
      dateUpdated: json['date_updated'] as int? ?? 0,
      favorite: json['favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$_KeywordModelToJson(_$_KeywordModel instance) =>
    <String, dynamic>{
      'keyword_id': instance.keywordId,
      'category_id': instance.categoryId,
      'keyword': instance.keyword,
      'for_subscribers': instance.forSubscribers,
      'bible_verse': instance.bibleVerse,
      'date_created': instance.dateCreated,
      'date_updated': instance.dateUpdated,
      'favorite': instance.favorite,
    };
