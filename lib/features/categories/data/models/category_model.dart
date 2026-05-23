import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int? id;

  @JsonKey(name: 'name_ar')
  final String? nameAr;

  @JsonKey(name: 'name_en')
  final String? nameEn;

  @JsonKey(name: 'name')
  final String? name;

  final String? image;

  final bool? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  CategoryModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.name,
    this.image,
    this.status,
    this.statusText,
    this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}