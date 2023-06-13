// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      categoryId: json['category_id'] as String? ?? '',
      categoryName: json['category_name'] as String? ?? '',
      forSubscribers: json['for_subscribers'] as bool? ?? false,
      keywords: json['keywords'] as String? ?? '',
      dateCreated: json['date_created'] as int? ?? 0,
      dateUpdated: json['date_updated'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'for_subscribers': instance.forSubscribers,
      'keywords': instance.keywords,
      'date_created': instance.dateCreated,
      'date_updated': instance.dateUpdated,
    };
