import 'package:ecommerce_app/features/cart/data/models/cart_product_model.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart_product.dart';

extension CartProductMapper on CartProductModel {
  CartProduct get toEntity => CartProduct(
      id: id,
      title: title,
      imageCoverURL: imageCoverURL,
      ratingsAverage: ratingsAverage);
}
