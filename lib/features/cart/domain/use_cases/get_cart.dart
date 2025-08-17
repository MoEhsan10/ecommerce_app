import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCart {
  final CartRepository _cartRepository;

  GetCart(this._cartRepository);

  Future<Either<Failure, Cart>> call() => _cartRepository.getCart();
}