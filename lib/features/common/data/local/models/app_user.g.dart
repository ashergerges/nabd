// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
  id: json['userId'] as String? ?? '',
  email: json['email'] as String? ?? '',
  phoneNumber: json['phone'] as String? ?? '',
  roles:
      (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
  token: json['accessToken'] as String? ?? '',
  refreshToken: json['refreshToken'] as String? ?? '',
  userName: json['userName'] as String? ?? '',
  fullName: json['fullName'] as String? ?? '',
  requiresEmail: json['requiresEmail'] as bool? ?? false,
  hasPin: json['hasPin'] as bool? ?? false,
);

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
  'userId': instance.id,
  'userName': instance.userName,
  'fullName': instance.fullName,
  'email': instance.email,
  'phone': instance.phoneNumber,
  'roles': instance.roles,
  'accessToken': instance.token,
  'refreshToken': instance.refreshToken,
  'requiresEmail': instance.requiresEmail,
  'hasPin': instance.hasPin,
};
