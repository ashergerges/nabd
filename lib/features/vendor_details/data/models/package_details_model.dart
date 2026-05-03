import 'package:json_annotation/json_annotation.dart';

part 'package_details_model.g.dart';

@JsonSerializable()
class PackageDetailsModel {
  final int? id;
  final String? title;
  final String? description;

  final String? image; // ✅ NEW

  final String? discount;

  @JsonKey(name: 'discount_percentage')
  final String? discountPercentage;

  @JsonKey(name: 'price_before')
  final String? priceBefore;

  @JsonKey(name: 'price_after')
  final String? priceAfter;

  @JsonKey(name: 'product_name')
  final String? productName;

  @JsonKey(name: 'vendor_name')
  final String? vendorName;

  @JsonKey(name: 'vendor_image')
  final String? vendorImage;

  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  final List<GalleryModel>? galleries;
  @JsonKey(name: 'booked_clients')

  final List<BookedClientModel>? bookedClients;

  @JsonKey(name: 'bookings_count')
  final int? bookingsCount;

  final String? address;

  @JsonKey(name: 'guest_count')
  final int? guestCount;

  @JsonKey(name: 'avg_rate')
  final double? avgRate; // ✅ NEW

  PackageDetailsModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.discount,
    this.discountPercentage,
    this.priceBefore,
    this.priceAfter,
    this.productName,
    this.vendorName,
    this.vendorImage,
    this.isFavorite,
    this.galleries,
    this.bookingsCount,
    this.address,
    this.guestCount,
    this.avgRate,
    this.bookedClients,
  });
  PackageDetailsModel copyWith({
    int? id,
    String? title,
    String? description,
    String? image,
    String? discount,
    String? discountPercentage,
    String? priceBefore,
    String? priceAfter,
    String? productName,
    String? vendorName,
    String? vendorImage,
    bool? isFavorite,
    List<GalleryModel>? galleries,
    int? bookingsCount,
    String? address,
    int? guestCount,
    double? avgRate,
  }) {
    return PackageDetailsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      discount: discount ?? this.discount,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      priceBefore: priceBefore ?? this.priceBefore,
      priceAfter: priceAfter ?? this.priceAfter,
      productName: productName ?? this.productName,
      vendorName: vendorName ?? this.vendorName,
      vendorImage: vendorImage ?? this.vendorImage,
      isFavorite: isFavorite ?? this.isFavorite,
      galleries: galleries ?? this.galleries,
      bookingsCount: bookingsCount ?? this.bookingsCount,
      address: address ?? this.address,
      guestCount: guestCount ?? this.guestCount,
      avgRate: avgRate ?? this.avgRate,
    );
  }
  factory PackageDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageDetailsModelToJson(this);
}
@JsonSerializable()
class BookedClientModel {
  final int? id;
  final String? name;
  final String? image;

  BookedClientModel({
    this.id,
    this.name,
    this.image,
  });

  factory BookedClientModel.fromJson(Map<String, dynamic> json) =>
      _$BookedClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookedClientModelToJson(this);
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