import 'package:ecommerce_app/features/cart/data/mappers/cart_item_mapper.dart';
import 'package:ecommerce_app/features/cart/data/models/CartModel.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart.dart';

extension CartMappers on CartModel {
  Cart get toEntity =>
      Cart(
          cartItems: items.map((cartItemModel) => cartItemModel.toEntity).toList(),
          totalCartPrice: totalCartPrice);
}
