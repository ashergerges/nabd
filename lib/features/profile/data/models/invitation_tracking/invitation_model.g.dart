// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationModel _$InvitationModelFromJson(Map<String, dynamic> json) =>
    InvitationModel(
      id: (json['id'] as num?)?.toInt(),
      bookingId: (json['booking_id'] as num?)?.toInt(),
      groomName: json['groom_name'] as String?,
      brideName: json['bride_name'] as String?,
      guests: (json['guests'] as List<dynamic>?)
          ?.map((e) => InvitationGuestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvitationModelToJson(InvitationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_id': instance.bookingId,
      'groom_name': instance.groomName,
      'bride_name': instance.brideName,
      'guests': instance.guests,
    };

InvitationGuestModel _$InvitationGuestModelFromJson(
  Map<String, dynamic> json,
) => InvitationGuestModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  status: (json['status'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$InvitationGuestModelToJson(
  InvitationGuestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'status': instance.status,
  'created_at': instance.createdAt,
};
