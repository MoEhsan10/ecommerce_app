import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/data/models/CartResponse.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartAPIRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;

  CartAPIRemoteDataSource(this._dio);

  @override
  Future<void> addToCart(String productId) async{
    try{
      final response = await _dio.post(
        ApiConstants.cartEndpoint,
        data: {"productId": productId},
      );
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data[message];
      }
      throw RemoteException(message: message ?? 'Failed to add to cart ');
    }
  }

  @override
  Future<CartResponse> getCart() async{
    try{
      final response = await _dio.get(
        ApiConstants.cartEndpoint,
      );
      return CartResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data[message];
      }
      throw RemoteException(message: message ?? "Failed to get cart");
    }
  }

  @override
  Future<CartResponse> updateCart(String productId, int quantity)async {
    try{
      final response = await _dio.put(
          '${ApiConstants.cartEndpoint}/$productId', // Fixed: removed quotes
          data: {
            "count" : quantity,
          }
      );
      return CartResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message']; // Fixed: was [message], should be ['message']
      }
      throw RemoteException(message: message ?? "Failed to update cart");
    }
  }

  @override
  Future<CartResponse> deleteFromCart(String productId)async {
    try{
      final response = await _dio.delete(
        '${ApiConstants.cartEndpoint}/$productId', // Fixed: removed quotes
      );
      return CartResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message']; // Fixed: was [message], should be ['message']
      }
      throw RemoteException(message: message ?? "Failed to delete product from cart");
    }
  }
}
