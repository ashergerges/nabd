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
      ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  topRatedVendors: (json['top_rated_vendors'] as List<dynamic>?)
      ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  offers: json['offers'] as List<dynamic>?,
  weddingVenues: (json['wedding_venues'] as List<dynamic>?)
      ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'sliders': instance.sliders,
      'categories': instance.categories,
      'top_rated_vendors': instance.topRatedVendors,
      'offers': instance.offers,
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
