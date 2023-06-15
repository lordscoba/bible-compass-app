// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as String?,
      categoryName: json['category_name'] as String? ?? '',
      forSubscribers: json['for_subscribers'] as bool? ?? false,
      keywords: (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      dateUpdated: json['date_updated'] == null
          ? null
          : DateTime.parse(json['date_updated'] as String),
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'for_subscribers': instance.forSubscribers,
      'keywords': instance.keywords,
      'date_created': instance.dateCreated?.toIso8601String(),
      'date_updated': instance.dateUpdated?.toIso8601String(),
    };
