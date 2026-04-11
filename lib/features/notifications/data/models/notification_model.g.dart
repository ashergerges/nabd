// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      userId: json['userId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['imageURL'] as String?,
      type: (json['type'] as num?)?.toInt() ?? 0,
      recordId: json['recordId'] as String? ?? '',
      isRead: json['isRead'] as bool? ?? false,
      id: json['id'] as String? ?? '',
      createdBy: json['createdBy'] as String? ?? '',
      createdOn: json['createdOn'] as String? ?? '',
      updatedBy: json['updatedBy'] as String? ?? '',
      updatedOn: json['updatedOn'] as String? ?? '',
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'imageURL': instance.imageUrl,
      'type': instance.type,
      'recordId': instance.recordId,
      'isRead': instance.isRead,
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdOn': instance.createdOn,
      'updatedBy': instance.updatedBy,
      'updatedOn': instance.updatedOn,
    };
