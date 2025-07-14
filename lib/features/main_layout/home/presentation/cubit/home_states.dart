import 'package:ecommerce_app/features/main_layout/home/domain/entities/category.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates{}


class GetCategoriesLoading extends HomeStates{

}

class GetCategoriesSuccess extends HomeStates{
  List<Category> categories;

  GetCategoriesSuccess({required this.categories});
}

class GetCategoriesError extends HomeStates{
  final String message;


  GetCategoriesError({required this.message});}