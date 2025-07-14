import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeApiRemoteDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  const HomeApiRemoteDataSource(this._dio);

  @override
  Future<CategoriesResponse> getCategories() async {
    try{
      final response = await _dio.get(ApiConstants.categoryEndpoint);
      return CategoriesResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get categories');
    }
  }
}
