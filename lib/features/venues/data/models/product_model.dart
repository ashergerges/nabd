import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int? id;

  @JsonKey(name: 'name_ar')
  final String? nameAr;

  @JsonKey(name: 'name_en')
  final String? nameEn;

  final String? image;

  @JsonKey(name: 'description_ar')
  final String? descriptionAr;

  @JsonKey(name: 'description_en')
  final String? descriptionEn;

  @JsonKey(name: 'price_after')
  final String? priceAfter;

  @JsonKey(name: 'price_before')
  final String? priceBefore;

  final String? discount;

  @JsonKey(name: 'guest_count')
  final int? guestCount;

  final int? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  final String? slug;
  final String? lat;
  final String? long;

  @JsonKey(name: 'avg_rating')
  final double? avgRating;

  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  ProductModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.image,
    this.descriptionAr,
    this.descriptionEn,
    this.priceAfter,
    this.priceBefore,
    this.discount,
    this.guestCount,
    this.status,
    this.statusText,
    this.slug,
    this.lat,
    this.long,

    this.avgRating,
    this.isFavorite,
    this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}