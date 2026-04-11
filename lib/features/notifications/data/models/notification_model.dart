import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: "userId", defaultValue: '')
  String userId;
  @JsonKey(name: "title", defaultValue: '')
  String title;
  @JsonKey(name: "description", defaultValue: '')
  String description;
  @JsonKey(name: "imageURL")
  String? imageUrl;
  @JsonKey(name: "type", defaultValue: 0)
  int type;
  @JsonKey(name: "recordId", defaultValue: '')
  String recordId;
  @JsonKey(name: "isRead", defaultValue: false)
  bool isRead;
  @JsonKey(name: "id", defaultValue: '')
  String id;
  @JsonKey(name: "createdBy", defaultValue: '')
  String createdBy;
  @JsonKey(name: "createdOn", defaultValue: '')
  String createdOn;
  @JsonKey(name: "updatedBy", defaultValue: '')
  String updatedBy;
  @JsonKey(name: "updatedOn", defaultValue: '')
  String updatedOn;

  NotificationModel({
    required this.userId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.recordId,
    required this.isRead,
    required this.id,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
  });

  NotificationModel copyWith({
    String? userId,
    String? title,
    String? description,
    String? imageUrl,
    int? type,
    String? recordId,
    bool? isRead,
    String? id,
    String? createdBy,
    String? createdOn,
    String? updatedBy,
    String? updatedOn,
  }) =>
      NotificationModel(
        userId: userId ?? this.userId,
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        type: type ?? this.type,
        recordId: recordId ?? this.recordId,
        isRead: isRead ?? this.isRead,
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdOn: createdOn ?? this.createdOn,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedOn: updatedOn ?? this.updatedOn,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
