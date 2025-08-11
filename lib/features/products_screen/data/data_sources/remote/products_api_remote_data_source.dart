import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/Products_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsAPIRemoteDataSource implements ProductsRemoteDataSource {

  final Dio _dio;

  ProductsAPIRemoteDataSource(this._dio);

  @override
  Future<ProductsResponse> getProducts(String? categoryId) async{
    try{
     final response = await _dio.get(
         ApiConstants.productsEndpoint,
       queryParameters: {
          if(categoryId != null) 'category' : categoryId
       }
     );
     return ProductsResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get products');
    }
  }
}
