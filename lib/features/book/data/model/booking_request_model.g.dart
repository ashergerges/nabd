// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequestModel _$BookingRequestModelFromJson(Map<String, dynamic> json) =>
    BookingRequestModel(
      packageId: (json['package_id'] as num?)?.toInt(),
      date: json['date'] as String?,
      time: json['time'] as String?,
      totalPrice: json['total_price'] as String?,
      paymentMethod: (json['payment_method'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookingRequestModelToJson(
  BookingRequestModel instance,
) => <String, dynamic>{
  'package_id': instance.packageId,
  'date': instance.date,
  'time': instance.time,
  'total_price': instance.totalPrice,
  'payment_method': instance.paymentMethod,
};
