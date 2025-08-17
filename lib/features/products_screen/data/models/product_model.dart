import 'package:ecommerce_app/core/models/category_model.dart';

import '../../../../core/models/brand_model.dart';

class ProductsModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final num quantity;
  final num price;
  final num sold;
  final List<String> imagesURLs;
  final num ratingsQuantity;
  final CategoryModel category;
  final BrandModel brand;

  final num? priceAfterDiscount;
  final String imagesCoverURL;


  final num ratingsAverage;
  final String createdAt;
  final String updatedAt;

  ProductsModel({
    required this.sold,
    required this.imagesURLs,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    this.priceAfterDiscount,
    required this.imagesCoverURL,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      sold: json['sold'] as num,
      imagesURLs: (json['images'] as List<dynamic>).cast<String>(),
      ratingsQuantity: json['ratingsQuantity'] as num,
      id: json['_id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as num,
      price: json['price'] as num,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      imagesCoverURL: json['imageCover'] as String,
      category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      brand: BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: json['ratingsAverage'] as num,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}