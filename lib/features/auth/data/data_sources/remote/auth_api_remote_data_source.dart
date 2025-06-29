import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response.dart';

class AuthApiRemoteDataSource extends AuthRemoteDataSource {
  final _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseURL,receiveDataWhenStatusError: true));


  @override
  Future<RegisterResponse> register(RegisterRequest request) async{
   final response = await _dio.post(
        ApiConstants.registerEndpoint,
      data: request.toJson(),
    );
  return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async{
   final response =await _dio.post(
       ApiConstants.loginEndpoint,
     data: request.toJson(),
   );
   return LoginResponse.fromJson(response.data);
  }


}
