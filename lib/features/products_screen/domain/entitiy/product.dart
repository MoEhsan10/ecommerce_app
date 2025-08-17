import 'package:ecommerce_app/core/models/category_model.dart';
import 'package:ecommerce_app/core/models/brand_model.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String id;
  final String title;
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

  Product({
    required this.sold,
    required this.imagesURLs,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    this.priceAfterDiscount,
    required this.imagesCoverURL,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
  });

  @override
  List<Object?> get props => [id];
}
