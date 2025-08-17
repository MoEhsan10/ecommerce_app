import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart.dart';

abstract class CartRepository {

  Future<Either<Failure,void>>addToCart(String productId);

  Future<Either<Failure,Cart>>getCart();

  Future<Either<Failure,Cart>>updateCart(String productId,int quantity);

  Future<Either<Failure,Cart>>deleteFromCart(String productId);
}