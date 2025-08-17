import 'package:ecommerce_app/core/models/brand_model.dart';
import 'package:ecommerce_app/core/models/category_model.dart';

class CartProductModel {
  final String id;
  final String title;
  final int? quantity;
  final String imageCoverURL;
  final CategoryModel category;
  final BrandModel brand;
  final double ratingsAverage;

  CartProductModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.imageCoverURL,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: (json['_id'] ?? json['id'] ?? '') as String,
      title: (json['title'] ?? '') as String,
      quantity: (json['quantity'] ?? 0) as int?,
      imageCoverURL: (json['imageCover'] ?? '') as String,
      category: CategoryModel.fromJson(
          (json['category'] ?? {}) as Map<String, dynamic>),
      brand: BrandModel.fromJson((json['brand'] ?? {}) as Map<String, dynamic>),
      ratingsAverage: ((json['ratingsAverage'] ?? 0.0) as num).toDouble(),
    );
  }
}