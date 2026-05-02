import 'package:json_annotation/json_annotation.dart';

part 'vendor_details_model.g.dart';

@JsonSerializable()
class VendorDetailsModel {
  final int? id;

  final String? name;

  @JsonKey(name: 'name_ar')
  final String? nameAr;

  @JsonKey(name: 'name_en')
  final String? nameEn;

  final String? image;

  final String? description;

  @JsonKey(name: 'description_ar')
  final String? descriptionAr;

  @JsonKey(name: 'description_en')
  final String? descriptionEn;

  final String? address;

  @JsonKey(name: 'price_after')
  final String? priceAfter;

  @JsonKey(name: 'price_before')
  final String? priceBefore;

  final String? discount;

  @JsonKey(name: 'discount_percentage')
  final String? discountPercentage;

  @JsonKey(name: 'guest_count')
  final int? guestCount;

  final int? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  final String? slug;
  final String? lat;
  final String? long;

  @JsonKey(name: 'contact_numbers')
  final List<String>? contactNumbers;

  final CategoryLiteModel? category;
  final CityModel? city;
  final UserModel? user;

  final List<GalleryModel>? gallery;
  final List<ReviewModel>? reviews;

  @JsonKey(name: 'avg_rating')
  final double? avgRating;

  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  @JsonKey(
    name: 'not_working_days',
    fromJson: _daysFromJson,
    toJson: _daysToJson,
  )
  final List<DateTime>? notWorkingDays;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  VendorDetailsModel({
    this.id,
    this.name,
    this.nameAr,
    this.nameEn,
    this.image,
    this.description,
    this.descriptionAr,
    this.descriptionEn,
    this.address,
    this.priceAfter,
    this.priceBefore,
    this.discount,
    this.discountPercentage,
    this.guestCount,
    this.status,
    this.statusText,
    this.slug,
    this.lat,
    this.long,
    this.contactNumbers,
    this.category,
    this.city,
    this.user,
    this.gallery,
    this.reviews,
    this.avgRating,
    this.isFavorite,
    this.notWorkingDays,
    this.createdAt,
  });

  factory VendorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$VendorDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorDetailsModelToJson(this);

  static List<DateTime>? _daysFromJson(List? list) =>
      list?.map((e) => DateTime.tryParse(e.toString())).whereType<DateTime>().toList();

  static List<String>? _daysToJson(List<DateTime>? list) =>
      list?.map((e) => e.toIso8601String()).toList();
}
@JsonSerializable()
class CategoryLiteModel {
  final int? id;

  @JsonKey(name: 'name_ar')
  final String? nameAr;

  @JsonKey(name: 'name_en')
  final String? nameEn;

  CategoryLiteModel({
    this.id,
    this.nameAr,
    this.nameEn,
  });

  factory CategoryLiteModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryLiteModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryLiteModelToJson(this);
}
@JsonSerializable()
class CityModel {
  final int? id;

  @JsonKey(name: 'name_ar')
  final String? nameAr;

  @JsonKey(name: 'name_en')
  final String? nameEn;

  CityModel({
    this.id,
    this.nameAr,
    this.nameEn,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;
  final String? email;

  UserModel({
    this.id,
    this.name,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
@JsonSerializable()
class GalleryModel {
  final int? id;
  final String? image;

  GalleryModel({
    this.id,
    this.image,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryModelToJson(this);
}

@JsonSerializable()
class ServiceModel {
  final int? id;

  @JsonKey(name: 'name_ar')
  final String? nameAr;

  @JsonKey(name: 'name_en')
  final String? nameEn;

  final String? image;

  @JsonKey(name: 'description_ar')
  final String? descriptionAr;

  @JsonKey(name: 'description_en')
  final String? descriptionEn;

  final String? price;
  final int? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  ServiceModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.image,
    this.descriptionAr,
    this.descriptionEn,
    this.price,
    this.status,
    this.statusText,
    this.createdAt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}

@JsonSerializable()
class ReviewModel   {
  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'user_image')
  final String? userImage;

  @JsonKey(name: 'product_id')
  final int? productId;

  @JsonKey(name: 'product_name')
  final String? productName;

  final double? rating;
  final String? comment;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  ReviewModel({
    this.id,
    this.userId,
    this.userName,
    this.userImage,
    this.productId,
    this.productName,
    this.rating,
    this.comment,
    this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}