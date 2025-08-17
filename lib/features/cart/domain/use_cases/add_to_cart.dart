import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToCart {
  final CartRepository _cartRepository;

  AddToCart(this._cartRepository);

  Future<Either<Failure, void>> call(String productId) => _cartRepository.addToCart(productId);
}