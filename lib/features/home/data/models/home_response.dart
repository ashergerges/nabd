import 'package:json_annotation/json_annotation.dart';
import 'package:nawy/features/home/data/models/city_model.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  final List<SliderModel>? sliders;
  final List<HomeCategoryModel>? categories;

  @JsonKey(name: 'top_rated_vendors')
  final List<HomeVendorModel>? topRatedVendors;

  final List<HomeOfferModel>? offers;
  final List<CityModel>? cities;

  @JsonKey(name: 'wedding_venues')
  final List<HomeVendorModel>? weddingVenues;

  HomeResponse({
    this.sliders,
    this.categories,
    this.topRatedVendors,
    this.offers,
    this.cities,
    this.weddingVenues,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
@JsonSerializable()
class SliderModel {
  final int? id;
  final String? image;

  @JsonKey(name: 'title_ar')
  final String? titleAr;

  @JsonKey(name: 'title_en')
  final String? titleEn;

  @JsonKey(name: 'description_ar')
  final String? descriptionAr;

  @JsonKey(name: 'description_en')
  final String? descriptionEn;

  final String? url;
  final int? status;
  final int? type;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  SliderModel({
    this.id,
    this.image,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.url,
    this.status,
    this.type,
    this.createdAt,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}

@JsonSerializable()
class HomeCategoryModel {
  final int? id;
  final String? name;

  HomeCategoryModel({
    this.id,
    this.name,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryModelToJson(this);
}
@JsonSerializable()
class HomeVendorModel {
  final int? id;
  final String? name;
  final String? image;
  final String? address;

  @JsonKey(name: 'avg_rating')
  final double? avgRating;

  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  HomeVendorModel({
    this.id,
    this.name,
    this.image,
    this.address,
    this.avgRating,
    this.isFavorite,
  });

  factory HomeVendorModel.fromJson(Map<String, dynamic> json) =>
      _$HomeVendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeVendorModelToJson(this);
}
@JsonSerializable()
class HomeOfferModel {
  final int? id;
  final String? name;
  final String? title;
  final String? image;
  final String? discount;

  @JsonKey(name: 'discount_percentage')
  final String? discountPercentage;

  @JsonKey(name: 'product_name')
  final String? productName;
  @JsonKey(name: 'vendor_name')
  final String? vendorName;
  @JsonKey(name: 'product_image')
  final String? productImage;

  HomeOfferModel({
    this.id,
    this.name,
    this.image,
    this.discount,
    this.title,
    this.discountPercentage,
    this.productName,
    this.vendorName,
    this.productImage,
  });

  factory HomeOfferModel.fromJson(Map<String, dynamic> json) =>
      _$HomeOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeOfferModelToJson(this);
}