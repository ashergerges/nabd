import 'package:json_annotation/json_annotation.dart';

part 'book_screen_model.g.dart';

@JsonSerializable()
class BookScreenModel {
  final int productId;
  final int packageId;
  final String packageName;
  final String productName;
  final int avgCount;
  final String image;
  final double price;

  BookScreenModel({
    required this.productId,
    required this.packageId,
    required this.packageName,
    required this.productName,
    required this.avgCount,
    required this.image,
    required this.price,
  });

  factory BookScreenModel.fromJson(Map<String, dynamic> json) =>
      _$BookScreenModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookScreenModelToJson(this);


}