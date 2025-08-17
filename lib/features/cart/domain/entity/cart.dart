import 'package:ecommerce_app/features/cart/domain/entity/cart_item_data.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final List<CartItemData> cartItems;
  final num totalCartPrice;

  Cart(
      {
      required this.cartItems,
      required this.totalCartPrice
      });


  @override
  List<Object?> get props => [cartItems];
}
