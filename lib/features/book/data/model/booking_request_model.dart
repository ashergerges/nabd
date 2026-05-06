import 'package:json_annotation/json_annotation.dart';

part 'booking_request_model.g.dart';

@JsonSerializable()
class BookingRequestModel {
  @JsonKey(name: 'package_id')
  final int? packageId;

  final String? date; // format: YYYY-MM-DD

  final String? time; // e.g. "06:00 PM"

  @JsonKey(name: 'total_price')
  final String? totalPrice;

  @JsonKey(name: 'payment_method')
  final int? paymentMethod;



  BookingRequestModel({
    this.packageId,
    this.date,
    this.time,
    this.totalPrice,
    this.paymentMethod,
  });
  BookingRequestModel copyWith({
    int? packageId,
    String? date,
    String? time,
    String? totalPrice,
    int? paymentMethod,
  }) {
    return BookingRequestModel(
      packageId: packageId ?? this.packageId,
      date: date ?? this.date,
      time: time ?? this.time,
      totalPrice: totalPrice ?? this.totalPrice,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
  factory BookingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingRequestModelToJson(this);
}