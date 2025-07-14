import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category.dart';

abstract class HomeRepository {
 Future<Either<Failure,List<Category>>> getCategories();
}