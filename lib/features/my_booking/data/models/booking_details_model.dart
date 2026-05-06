import 'package:json_annotation/json_annotation.dart';

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
  final double? totalPrice;

  final Package? package;

  final String? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  final dynamic coupon;
  final double? discount;

  @JsonKey(name: 'price_after_discount')
  final double? priceAfterDiscount;

  @JsonKey(name: 'cancel_reason')
  final String? cancelReason;

  @JsonKey(name: 'created_at')
  final String? createdAt;

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
  });

  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDetailsModelToJson(this);
}
@JsonSerializable()
class Product {
  final int? id;
  final String? name;
  final String? address;

  @JsonKey(name: 'guest_count')
  final int? guestCount;

  Product({
    this.id,
    this.name,
    this.address,
    this.guestCount,
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

  Package({this.id, this.name, this.image});

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);

  Map<String, dynamic> toJson() => _$PackageToJson(this);
}