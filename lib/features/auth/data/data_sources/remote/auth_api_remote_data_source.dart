import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/exceptions.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource extends AuthRemoteDataSource {
  final Dio dio;

  AuthApiRemoteDataSource({required this.dio});

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.registerEndpoint,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to register');
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.loginEndpoint,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to register');
    }
  }
}
