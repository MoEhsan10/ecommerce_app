import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products_screen/domain/entitiy/product.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProducts {
  final ProductsRepository _productsRepository;

  const GetProducts(this._productsRepository);


  Future<Either<Failure, List<Product>>> call(String? categoryId)=> _productsRepository.getProducts(categoryId);
}