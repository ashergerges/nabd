// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDetailsModel _$BookingDetailsModelFromJson(Map<String, dynamic> json) =>
    BookingDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      paidOn: json['paid_on'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      totalPrice: json['total_price'] as String?,
      package: json['package'] == null
          ? null
          : Package.fromJson(json['package'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      statusText: json['status_text'] as String?,
      coupon: json['coupon'],
      discount: json['discount'] as String?,
      priceAfterDiscount: json['price_after_discount'] as String?,
      cancelReason: json['cancel_reason'] as String?,
      createdAt: json['created_at'] as String?,
      isReviewed: json['is_reviewed'] as bool?,
    );

Map<String, dynamic> _$BookingDetailsModelToJson(
  BookingDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'product': instance.product?.toJson(),
  'paid_on': instance.paidOn,
  'date': instance.date,
  'time': instance.time,
  'total_price': instance.totalPrice,
  'package': instance.package?.toJson(),
  'status': instance.status,
  'status_text': instance.statusText,
  'coupon': instance.coupon,
  'discount': instance.discount,
  'price_after_discount': instance.priceAfterDiscount,
  'cancel_reason': instance.cancelReason,
  'created_at': instance.createdAt,
  'is_reviewed': instance.isReviewed,
};

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  address: json['address'] as String?,
  guestCount: (json['guest_count'] as num?)?.toInt(),
  lat: json['lat'] as String?,
  long: json['long'] as String?,
  phone: json['phone'] as String?,
  rate: (json['rate'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'lat': instance.lat,
  'long': instance.long,
  'phone': instance.phone,
  'rate': instance.rate,
  'guest_count': instance.guestCount,
};

Package _$PackageFromJson(Map<String, dynamic> json) => Package(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  services: (json['services'] as List<dynamic>?)
      ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'services': instance.services,
};
