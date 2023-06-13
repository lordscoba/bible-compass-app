// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscriptionModel _$$_SubscriptionModelFromJson(Map<String, dynamic> json) =>
    _$_SubscriptionModel(
      subscriptionId: json['subscription_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      type: json['type'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      status: json['status'] as bool? ?? false,
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      dateCreated: (json['date_created'] as num?)?.toDouble() ?? 0,
      dateExpiring: (json['date_expiring'] as num?)?.toDouble() ?? 0,
      dateUpdated: (json['date_updated'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_SubscriptionModelToJson(
        _$_SubscriptionModel instance) =>
    <String, dynamic>{
      'subscription_id': instance.subscriptionId,
      'user_id': instance.userId,
      'username': instance.username,
      'type': instance.type,
      'amount': instance.amount,
      'status': instance.status,
      'duration': instance.duration,
      'date_created': instance.dateCreated,
      'date_expiring': instance.dateExpiring,
      'date_updated': instance.dateUpdated,
    };
