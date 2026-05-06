// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookConfirmationModel _$BookConfirmationModelFromJson(
  Map<String, dynamic> json,
) => BookConfirmationModel(
  id: (json['id'] as num?)?.toInt(),
  code: json['code'] as String?,
);

Map<String, dynamic> _$BookConfirmationModelToJson(
  BookConfirmationModel instance,
) => <String, dynamic>{'id': instance.id, 'code': instance.code};
