import 'package:ecommerce_app/features/cart/data/models/CartResponse.dart';

abstract class CartRemoteDataSource {

  Future<void>addToCart(String productId);
  Future<CartResponse>getCart();
  Future<CartResponse>updateCart(String productId,int quantity);
  Future<CartResponse>deleteFromCart(String productId);
}