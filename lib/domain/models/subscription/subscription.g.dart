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
      email: json['email'] as String? ?? '',
      type: json['type'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      status: json['status'] as bool? ?? false,
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: json['duration'] as int),
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
      'email': instance.email,
      'type': instance.type,
      'amount': instance.amount,
      'status': instance.status,
      'duration': instance.duration?.inMicroseconds,
      'date_created': instance.dateCreated?.toIso8601String(),
      'date_expiring': instance.dateExpiring?.toIso8601String(),
      'date_updated': instance.dateUpdated?.toIso8601String(),
    };

_$_PaystackModel _$$_PaystackModelFromJson(Map<String, dynamic> json) =>
    _$_PaystackModel(
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaystackModelToJson(_$_PaystackModel instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
