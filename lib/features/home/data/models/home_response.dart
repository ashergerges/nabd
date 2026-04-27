import 'package:json_annotation/json_annotation.dart';
import 'package:nawy/features/categories/data/models/category_model.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  final List<SliderModel>? sliders;
  final List<CategoryModel>? categories;

  @JsonKey(name: 'top_rated_vendors')
  final List<ProductModel>? topRatedVendors;

  final List<dynamic>? offers;

  @JsonKey(name: 'wedding_venues')
  final List<ProductModel>? weddingVenues;

  HomeResponse({
    this.sliders,
    this.categories,
    this.topRatedVendors,
    this.offers,
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