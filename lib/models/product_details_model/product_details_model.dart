import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_model.freezed.dart';
part 'product_details_model.g.dart';

@freezed
abstract class ProductDetailsModel with _$ProductDetailsModel {
  const factory ProductDetailsModel({
    @Default(0) @JsonKey(name: "id") int id,
    @Default("") @JsonKey(name: "title") String title,
    @Default("") @JsonKey(name: "description") String description,
    @Default("") @JsonKey(name: "category") String category,
    @Default(0.0) @JsonKey(name: "price") double price,
    @Default([]) @JsonKey(name: "images") List<String> images,
    @Default(0.0) @JsonKey(name: "rating") double rating,
  }) = _ProductDetailsModel;
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
}
