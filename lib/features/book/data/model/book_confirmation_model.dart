import 'package:json_annotation/json_annotation.dart';

part 'book_confirmation_model.g.dart';

@JsonSerializable()
class BookConfirmationModel {
  final int? id;
  final String? code;

  BookConfirmationModel({
    this.id,
    this.code,
  });

  factory BookConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$BookConfirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookConfirmationModelToJson(this);

}