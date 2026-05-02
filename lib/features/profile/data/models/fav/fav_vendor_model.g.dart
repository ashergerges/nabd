// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavVendorModel _$FavVendorModelFromJson(Map<String, dynamic> json) =>
    FavVendorModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      priceBefore: json['price_before'] as String?,
      priceAfter: json['price_after'] as String?,
      discount: json['discount'] as String?,
    );

Map<String, dynamic> _$FavVendorModelToJson(FavVendorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'is_favorite': instance.isFavorite,
      'price_before': instance.priceBefore,
      'price_after': instance.priceAfter,
      'discount': instance.discount,
    };
