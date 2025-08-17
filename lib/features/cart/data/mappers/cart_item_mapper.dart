import 'package:ecommerce_app/features/cart/data/mappers/cart_product_mapper.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart_item_data.dart';

extension CartItemMapper on CartItemModel {
  CartItemData get toEntity =>
      CartItemData(count: count, id: id, product: product.toEntity, price: price);
}
