import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/mappers/product_mappers.dart';
import 'package:ecommerce_app/features/products_screen/domain/entitiy/product.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _productsRemoteDataSource;

  const ProductsRepositoryImpl(this._productsRemoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts(String? categoryId) async {
    try{
      final response = await _productsRemoteDataSource.getProducts(categoryId);
      final products = response.products
          .map((productModel) => productModel.toEntity)
          .toList();
      return Right(products);
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }
}
