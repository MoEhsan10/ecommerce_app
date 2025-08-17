import 'CartModel.dart';

class CartResponse {

  final String status;
  final int numOfCartItems;
  final String? cartId;
  final CartModel? cart;

  CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.cart,});

  factory CartResponse.fromJson(dynamic json) {
    return CartResponse(
      status: json['status'] as String,
      numOfCartItems: json['numOfCartItems'] as int,
      cartId: json['cartId'] as String?,
      cart: json['data'] != null ? CartModel.fromJson(json['data']) : null,
    );
  }

}