// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookScreenModel _$BookScreenModelFromJson(Map<String, dynamic> json) =>
    BookScreenModel(
      productId: (json['productId'] as num).toInt(),
      packageId: (json['packageId'] as num).toInt(),
      packageName: json['packageName'] as String,
      productName: json['productName'] as String,
      avgCount: (json['avgCount'] as num).toInt(),
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$BookScreenModelToJson(BookScreenModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'packageId': instance.packageId,
      'packageName': instance.packageName,
      'productName': instance.productName,
      'avgCount': instance.avgCount,
      'image': instance.image,
      'price': instance.price,
    };
