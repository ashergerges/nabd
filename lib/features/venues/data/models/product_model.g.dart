// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num?)?.toInt(),
  nameAr: json['name_ar'] as String?,
  nameEn: json['name_en'] as String?,
  image: json['image'] as String?,
  descriptionAr: json['description_ar'] as String?,
  descriptionEn: json['description_en'] as String?,
  priceAfter: json['price_after'] as String?,
  priceBefore: json['price_before'] as String?,
  discount: json['discount'] as String?,
  guestCount: (json['guest_count'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  statusText: json['status_text'] as String?,
  slug: json['slug'] as String?,
  lat: json['lat'] as String?,
  long: json['long'] as String?,
  avgRating: (json['avg_rating'] as num?)?.toDouble(),
  isFavorite: json['is_favorite'] as bool?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'image': instance.image,
      'description_ar': instance.descriptionAr,
      'description_en': instance.descriptionEn,
      'price_after': instance.priceAfter,
      'price_before': instance.priceBefore,
      'discount': instance.discount,
      'guest_count': instance.guestCount,
      'status': instance.status,
      'status_text': instance.statusText,
      'slug': instance.slug,
      'lat': instance.lat,
      'long': instance.long,
      'avg_rating': instance.avgRating,
      'is_favorite': instance.isFavorite,
      'created_at': instance.createdAt,
    };
