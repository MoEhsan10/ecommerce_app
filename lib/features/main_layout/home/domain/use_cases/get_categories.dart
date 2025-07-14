import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategories {
  final HomeRepository _homeRepository;

  GetCategories(this._homeRepository);

 Future<Either<Failure,List<Category>>> call() =>_homeRepository.getCategories();

}