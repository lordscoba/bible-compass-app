// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscriptionModel _$$_SubscriptionModelFromJson(Map<String, dynamic> json) =>
    _$_SubscriptionModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      type: json['type'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      status: json['status'] as bool? ?? false,
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      dateExpiring: json['date_expiring'] == null
          ? null
          : DateTime.parse(json['date_expiring'] as String),
      dateUpdated: json['date_updated'] == null
          ? null
          : DateTime.parse(json['date_updated'] as String),
    );

Map<String, dynamic> _$$_SubscriptionModelToJson(
        _$_SubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'username': instance.username,
      'type': instance.type,
      'amount': instance.amount,
      'status': instance.status,
      'duration': instance.duration,
      'date_created': instance.dateCreated?.toIso8601String(),
      'date_expiring': instance.dateExpiring?.toIso8601String(),
      'date_updated': instance.dateUpdated?.toIso8601String(),
    };
