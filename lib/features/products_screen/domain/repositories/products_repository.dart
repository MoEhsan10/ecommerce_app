import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products_screen/domain/entitiy/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure,List<Product>>> getProducts(String? categoryId);
}