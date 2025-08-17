import 'package:ecommerce_app/features/cart/data/models/cart_product_model.dart';

class CartItemModel {
  final int count;
  final String id;
  final CartProductModel product;
  final num price;

  CartItemModel({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartItemModel.fromJson(dynamic json) {
    return CartItemModel(
      count: (json['count'] ?? 0) as int,
      id: (json['_id'] ?? '') as String,
      product: CartProductModel.fromJson(
          (json['product'] ?? {}) as Map<String, dynamic>),
      price: (json['price'] ?? 0) as num,
    );
  }
}