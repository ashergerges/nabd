import 'package:json_annotation/json_annotation.dart';
import 'package:nawy/features/vendor_details/data/models/vendor_details_model.dart';

part 'booking_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingDetailsModel {
  final int? id;
  final String? code;

  final Product? product;

  @JsonKey(name: 'paid_on')
  final String? paidOn;

  final String? date;
  final String? time;

  @JsonKey(name: 'total_price')
  final String? totalPrice;

  final Package? package;

  final int? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  final dynamic coupon;
  final String? discount;

  @JsonKey(name: 'price_after_discount')
  final String? priceAfterDiscount;

  @JsonKey(name: 'cancel_reason')
  final String? cancelReason;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'is_reviewed')
  final bool? isReviewed;

  BookingDetailsModel({
    this.id,
    this.code,
    this.product,
    this.paidOn,
    this.date,
    this.time,
    this.totalPrice,
    this.package,
    this.status,
    this.statusText,
    this.coupon,
    this.discount,
    this.priceAfterDiscount,
    this.cancelReason,
    this.createdAt,
    this.isReviewed,
  });
  BookingDetailsModel copyWith({
    int? id,
    String? code,
    Product? product,
    String? paidOn,
    String? date,
    String? time,
    String? totalPrice,
    Package? package,
    int? status,
    String? statusText,
    dynamic coupon,
    String? discount,
    String? priceAfterDiscount,
    String? cancelReason,
    String? createdAt,
    bool? isReviewed,
  }) {
    return BookingDetailsModel(
      id: id ?? this.id,
      code: code ?? this.code,
      product: product ?? this.product,
      paidOn: paidOn ?? this.paidOn,
      date: date ?? this.date,
      time: time ?? this.time,
      totalPrice: totalPrice ?? this.totalPrice,
      package: package ?? this.package,
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
      coupon: coupon ?? this.coupon,
      discount: discount ?? this.discount,
      priceAfterDiscount:
      priceAfterDiscount ?? this.priceAfterDiscount,
      cancelReason: cancelReason ?? this.cancelReason,
      createdAt: createdAt ?? this.createdAt,
      isReviewed: isReviewed ?? this.isReviewed,
    );
  }
  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDetailsModelToJson(this);
}
@JsonSerializable()
class Product {
  final int? id;
  final String? name;
  final String? address;
  final String? lat;
  final String? long;
  final String? phone;
  final double? rate;

  @JsonKey(name: 'guest_count')
  final int? guestCount;

  Product({
    this.id,
    this.name,
    this.address,
    this.guestCount,
    this.lat,
    this.long,
    this.phone,
    this.rate,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
@JsonSerializable()
class Package {
  final int? id;
  final String? name;
  final String? image;
  final List<ServiceModel>? services;

  Package({this.id, this.name, this.image,this.services});

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);

  Map<String, dynamic> toJson() => _$PackageToJson(this);
}