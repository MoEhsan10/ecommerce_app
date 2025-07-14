import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/mappers/category_mapper.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl  implements HomeRepository{

  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);
  @override

  Future<Either<Failure, List<Category>>> getCategories() async{
    try{
      final response = await _remoteDataSource.getCategories();
      final categories = (response.categories as List<CategoryModel>).map((categoryModel) => categoryModel.toEntity).toList();
      return Right(categories);
    } on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }}