import 'package:json_annotation/json_annotation.dart';

part 'fav_vendor_model.g.dart';

@JsonSerializable()
class FavVendorModel {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  @JsonKey(name: 'price_before')
  final String? priceBefore;

  @JsonKey(name: 'price_after')
  final String? priceAfter;

  final String? discount;


  FavVendorModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.isFavorite,
    this.priceBefore,
    this.priceAfter,
    this.discount,
  });

  factory FavVendorModel.fromJson(Map<String, dynamic> json) =>
      _$FavVendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavVendorModelToJson(this);
}