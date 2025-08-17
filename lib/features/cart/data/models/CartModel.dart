import 'cart_item_model.dart';

class CartModel {
  final num totalCartPrice;
  final List<CartItemModel> items;
  final String? id;
  final String? cartOwnerId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;


  CartModel({
    required this.id,
    required this.cartOwnerId,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,});

  factory CartModel.fromJson(dynamic json) {
    List<CartItemModel> cartItemsList = [];
    if (json['products'] != null) {
      cartItemsList = (json['products'] as List)
          .map((v) => CartItemModel.fromJson(v))
          .toList();
    }

    return CartModel(
      id: json['_id'] as String?,
      cartOwnerId: json['cartOwner'] as String?,
      items: cartItemsList,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
      v: json['__v'] as int?,
      totalCartPrice: json['totalCartPrice'] as num,
    );
  }
}