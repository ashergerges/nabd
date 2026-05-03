// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorDetailsModel _$VendorDetailsModelFromJson(Map<String, dynamic> json) =>
    VendorDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      descriptionAr: json['description_ar'] as String?,
      descriptionEn: json['description_en'] as String?,
      address: json['address'] as String?,
      priceAfter: json['price_after'] as String?,
      priceBefore: json['price_before'] as String?,
      discount: json['discount'] as String?,
      discountPercentage: json['discount_percentage'] as String?,
      guestCount: (json['guest_count'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      statusText: json['status_text'] as String?,
      slug: json['slug'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      contactNumbers: (json['contact_numbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: json['category'] == null
          ? null
          : CategoryLiteModel.fromJson(
              json['category'] as Map<String, dynamic>,
            ),
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => GalleryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      avgRating: (json['avg_rating'] as num?)?.toDouble(),
      isFavorite: json['is_favorite'] as bool?,
      notWorkingDays: VendorDetailsModel._daysFromJson(
        json['not_working_days'] as List?,
      ),
      createdAt: json['created_at'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      packages: (json['packages'] as List<dynamic>?)
          ?.map((e) => PackageDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VendorDetailsModelToJson(
  VendorDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'name_ar': instance.nameAr,
  'name_en': instance.nameEn,
  'image': instance.image,
  'description': instance.description,
  'description_ar': instance.descriptionAr,
  'description_en': instance.descriptionEn,
  'address': instance.address,
  'price_after': instance.priceAfter,
  'price_before': instance.priceBefore,
  'discount': instance.discount,
  'discount_percentage': instance.discountPercentage,
  'guest_count': instance.guestCount,
  'status': instance.status,
  'status_text': instance.statusText,
  'slug': instance.slug,
  'lat': instance.lat,
  'long': instance.long,
  'contact_numbers': instance.contactNumbers,
  'category': instance.category,
  'city': instance.city,
  'user': instance.user,
  'gallery': instance.gallery,
  'reviews': instance.reviews,
  'packages': instance.packages,
  'services': instance.services,
  'avg_rating': instance.avgRating,
  'is_favorite': instance.isFavorite,
  'not_working_days': VendorDetailsModel._daysToJson(instance.notWorkingDays),
  'created_at': instance.createdAt,
};

CategoryLiteModel _$CategoryLiteModelFromJson(Map<String, dynamic> json) =>
    CategoryLiteModel(
      id: (json['id'] as num?)?.toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );

Map<String, dynamic> _$CategoryLiteModelToJson(CategoryLiteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  id: (json['id'] as num?)?.toInt(),
  nameAr: json['name_ar'] as String?,
  nameEn: json['name_en'] as String?,
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name_ar': instance.nameAr,
  'name_en': instance.nameEn,
};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
};

GalleryModel _$GalleryModelFromJson(Map<String, dynamic> json) => GalleryModel(
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$GalleryModelToJson(GalleryModel instance) =>
    <String, dynamic>{'id': instance.id, 'image': instance.image};

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
  id: (json['id'] as num?)?.toInt(),
  nameAr: json['name_ar'] as String?,
  nameEn: json['name_en'] as String?,
  name: json['name'] as String?,
  price: json['price'] as String?,
);

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'name': instance.name,
      'price': instance.price,
    };

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  userName: json['user_name'] as String?,
  userImage: json['user_image'] as String?,
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  comment: json['comment'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_image': instance.userImage,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt,
    };
