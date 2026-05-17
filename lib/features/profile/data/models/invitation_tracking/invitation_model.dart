import 'package:json_annotation/json_annotation.dart';

part 'invitation_model.g.dart';

@JsonSerializable()
class InvitationModel {
  final int? id;

  @JsonKey(name: 'booking_id')
  final int? bookingId;

  @JsonKey(name: 'groom_name')
  final String? groomName;

  @JsonKey(name: 'bride_name')
  final String? brideName;

  final List<InvitationGuestModel>? guests;

  InvitationModel({
    this.id,
    this.bookingId,
    this.groomName,
    this.brideName,
    this.guests,
  });

  factory InvitationModel.fromJson(Map<String, dynamic> json) =>
      _$InvitationModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvitationModelToJson(this);

  // ✅ copyWith
  InvitationModel copyWith({
    int? id,
    int? bookingId,
    String? groomName,
    String? brideName,
    List<InvitationGuestModel>? guests,
  }) {
    return InvitationModel(
      id: id ?? this.id,
      bookingId: bookingId ?? this.bookingId,
      groomName: groomName ?? this.groomName,
      brideName: brideName ?? this.brideName,
      guests: guests ?? this.guests,
    );
  }
}

@JsonSerializable()
class InvitationGuestModel {
  final int? id;
  final String? name;
  final String? phone;
  final int? status;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  InvitationGuestModel({
    this.id,
    this.name,
    this.phone,
    this.status,
    this.createdAt,
  });

  factory InvitationGuestModel.fromJson(Map<String, dynamic> json) =>
      _$InvitationGuestModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvitationGuestModelToJson(this);

  // ✅ copyWith
  InvitationGuestModel copyWith({
    int? id,
    String? name,
    String? phone,
    int? status,
    String? createdAt,
  }) {
    return InvitationGuestModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}