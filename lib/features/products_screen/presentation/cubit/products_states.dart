import 'package:ecommerce_app/features/products_screen/domain/entitiy/product.dart';

abstract class ProductsStates {}


class ProductInitial extends ProductsStates{}

class GetProductLoading extends ProductsStates{}

class GetProductSuccess extends ProductsStates{
final List<Product> products;

  GetProductSuccess({required this.products});
}


class GetProductError extends ProductsStates{
  String message;
  GetProductError({required this.message});
}


class ProductQuantityChanged extends ProductsStates{}