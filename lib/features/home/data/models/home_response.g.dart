// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
  sliders: (json['sliders'] as List<dynamic>?)
      ?.map((e) => SliderModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => HomeCategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  topRatedVendors: (json['top_rated_vendors'] as List<dynamic>?)
      ?.map((e) => HomeVendorModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  offers: (json['offers'] as List<dynamic>?)
      ?.map((e) => HomeOfferModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  cities: (json['cities'] as List<dynamic>?)
      ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  weddingVenues: (json['wedding_venues'] as List<dynamic>?)
      ?.map((e) => HomeVendorModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'sliders': instance.sliders,
      'categories': instance.categories,
      'top_rated_vendors': instance.topRatedVendors,
      'offers': instance.offers,
      'cities': instance.cities,
      'wedding_venues': instance.weddingVenues,
    };

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
  titleAr: json['title_ar'] as String?,
  titleEn: json['title_en'] as String?,
  descriptionAr: json['description_ar'] as String?,
  descriptionEn: json['description_en'] as String?,
  url: json['url'] as String?,
  status: (json['status'] as num?)?.toInt(),
  type: (json['type'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title_ar': instance.titleAr,
      'title_en': instance.titleEn,
      'description_ar': instance.descriptionAr,
      'description_en': instance.descriptionEn,
      'url': instance.url,
      'status': instance.status,
      'type': instance.type,
      'created_at': instance.createdAt,
    };

HomeCategoryModel _$HomeCategoryModelFromJson(Map<String, dynamic> json) =>
    HomeCategoryModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$HomeCategoryModelToJson(HomeCategoryModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

HomeVendorModel _$HomeVendorModelFromJson(Map<String, dynamic> json) =>
    HomeVendorModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      avgRating: (json['avg_rating'] as num?)?.toDouble(),
      isFavorite: json['is_favorite'] as bool?,
    );

Map<String, dynamic> _$HomeVendorModelToJson(HomeVendorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'address': instance.address,
      'avg_rating': instance.avgRating,
      'is_favorite': instance.isFavorite,
    };

HomeOfferModel _$HomeOfferModelFromJson(Map<String, dynamic> json) =>
    HomeOfferModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      discount: json['discount'] as String?,
      discountPercentage: json['discount_percentage'] as String?,
      productName: json['product_name'] as String?,
      vendorName: json['vendor_name'] as String?,
      vendorImage: json['vendor_image'] as String?,
    );

Map<String, dynamic> _$HomeOfferModelToJson(HomeOfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'discount': instance.discount,
      'discount_percentage': instance.discountPercentage,
      'product_name': instance.productName,
      'vendor_name': instance.vendorName,
      'vendor_image': instance.vendorImage,
    };
