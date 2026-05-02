import 'package:json_annotation/json_annotation.dart';

part 'fav_package_model.g.dart';

@JsonSerializable()
class FavPackageModel {
  final int? id;
  final String? title;
  final String? description;
  final String? image;

  final String? discount;

  @JsonKey(name: 'discount_percentage')
  final String? discountPercentage;

  @JsonKey(name: 'price_before')
  final String? priceBefore;

  @JsonKey(name: 'price_after')
  final String? priceAfter;

  @JsonKey(name: 'product_name')
  final String? productName;

  @JsonKey(name: 'vendor_name')
  final String? vendorName;

  @JsonKey(name: 'vendor_image')
  final String? vendorImage;

  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;


  @JsonKey(name: 'bookings_count')
  final int? bookingsCount;

  final String? address;

  @JsonKey(name: 'guest_count')
  final int? guestCount;
  @JsonKey(name: 'avg_rate')
  final double? avgRate;

  FavPackageModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.discount,
    this.discountPercentage,
    this.priceBefore,
    this.priceAfter,
    this.productName,
    this.vendorName,
    this.vendorImage,
    this.isFavorite,
    this.bookingsCount,
    this.address,
    this.guestCount,
    this.avgRate,
  });

  factory FavPackageModel.fromJson(Map<String, dynamic> json) =>
      _$FavPackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavPackageModelToJson(this);
}