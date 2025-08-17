import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteFromCart {
  final CartRepository _cartRepository;

  DeleteFromCart(this._cartRepository);

  Future<Either<Failure, Cart>> call(String productId) => _cartRepository.deleteFromCart(productId);
}
