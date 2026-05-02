// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageDetailsModel _$PackageDetailsModelFromJson(Map<String, dynamic> json) =>
    PackageDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      discount: json['discount'] as String?,
      discountPercentage: json['discount_percentage'] as String?,
      priceBefore: json['price_before'] as String?,
      priceAfter: json['price_after'] as String?,
      productName: json['product_name'] as String?,
      vendorName: json['vendor_name'] as String?,
      vendorImage: json['vendor_image'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => GalleryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingsCount: (json['bookings_count'] as num?)?.toInt(),
      address: json['address'] as String?,
      guestCount: (json['guest_count'] as num?)?.toInt(),
      avgRate: (json['avg_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PackageDetailsModelToJson(
  PackageDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'discount': instance.discount,
  'discount_percentage': instance.discountPercentage,
  'price_before': instance.priceBefore,
  'price_after': instance.priceAfter,
  'product_name': instance.productName,
  'vendor_name': instance.vendorName,
  'vendor_image': instance.vendorImage,
  'is_favorite': instance.isFavorite,
  'galleries': instance.galleries,
  'bookings_count': instance.bookingsCount,
  'address': instance.address,
  'guest_count': instance.guestCount,
  'avg_rate': instance.avgRate,
};

GalleryModel _$GalleryModelFromJson(Map<String, dynamic> json) => GalleryModel(
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$GalleryModelToJson(GalleryModel instance) =>
    <String, dynamic>{'id': instance.id, 'image': instance.image};
