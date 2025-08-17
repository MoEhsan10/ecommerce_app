import 'package:ecommerce_app/features/cart/domain/entity/cart_product.dart';
import 'package:equatable/equatable.dart';

class CartItemData extends Equatable{
  final int count;
  final String id;
  final CartProduct product;
  final num price;

  CartItemData(
      {required this.count,
      required this.id,
      required this.product,
      required this.price});


  @override
  List<Object?> get props => [id];
}
