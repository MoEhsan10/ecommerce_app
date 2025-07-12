import 'package:ecommerce_app/features/auth/data/models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest request);

  Future<LoginResponse> login(LoginRequest request);
}