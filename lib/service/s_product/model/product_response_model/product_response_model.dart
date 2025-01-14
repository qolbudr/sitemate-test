// ignore_for_file:depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response_model.freezed.dart';
part 'product_response_model.g.dart';

@freezed
class ProductResponse with _$ProductResponse {
  const ProductResponse._();
  const factory ProductResponse({
    List<Product>? products,
    num? total,
    num? skip,
    num? limit,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    num? id,
    String? title,
    String? description,
    double? price,
    double? discountPercentage,
    double? rating,
    num? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    num? weight,
    String? warrantyInformation,
    String? shippingInformation,
    num? minimumOrderQuantity,
    List<String>? images,
    String? thumbnail,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
