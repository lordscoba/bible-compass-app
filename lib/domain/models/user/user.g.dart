// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      confirmPassword: json['confirm_password'] as String? ?? '',
      email: json['email'] as String? ?? '',
      key: json['key'] as String? ?? '',
      dateCreated: (json['date_created'] as num?)?.toDouble() ?? 0,
      dateUpdated: (json['date_updated'] as num?)?.toDouble() ?? 0,
      isVerified: json['is_verified'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'username': instance.username,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
      'email': instance.email,
      'key': instance.key,
      'date_created': instance.dateCreated,
      'date_updated': instance.dateUpdated,
      'is_verified': instance.isVerified,
    };
