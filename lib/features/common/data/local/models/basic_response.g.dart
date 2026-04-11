// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasicResponseImpl<T> _$$BasicResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$BasicResponseImpl<T>(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
  isError: json['isError'] as bool?,
  message: json['message'] as String?,
  result: _$nullableGenericFromJson(json['result'], fromJsonT),
);

Map<String, dynamic> _$$BasicResponseImplToJson<T>(
  _$BasicResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'timestamp': instance.timestamp?.toIso8601String(),
  'isError': instance.isError,
  'message': instance.message,
  'result': _$nullableGenericToJson(instance.result, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
