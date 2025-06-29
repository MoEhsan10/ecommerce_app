import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';

class AuthRepository {
  final _authRemoteDataSource = AuthApiRemoteDataSource();
  final _authLocalDataSource = AuthSharedPrefLocalDataSource();


  Future<User> register(RegisterRequest request)async{
    final response =  await _authRemoteDataSource.register(request);
    _authLocalDataSource.saveToken(response.token);
    return response.user;
  }

  Future<User> login(LoginRequest request)async{
    final response =  await _authRemoteDataSource.login(request);
    await _authLocalDataSource.saveToken(response.token!);
    return response.user!;
  }
}