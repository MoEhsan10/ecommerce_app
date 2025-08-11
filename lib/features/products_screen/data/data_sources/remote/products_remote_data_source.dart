import 'package:ecommerce_app/features/products_screen/data/models/Products_response.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsResponse> getProducts(String? categoryId);
}