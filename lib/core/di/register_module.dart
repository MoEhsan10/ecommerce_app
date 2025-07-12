import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {

  @singleton
  Dio dio() => Dio(
      BaseOptions(
          baseUrl: ApiConstants.baseURL, receiveDataWhenStatusError: true),
  );


  @preResolve
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();
}