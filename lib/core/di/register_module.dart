import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {

  @singleton
  Dio get dio {
    final dio=
   Dio (
      BaseOptions(
          baseUrl: ApiConstants.baseURL, receiveDataWhenStatusError: true),
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async{
        final sharedPref =serviceLocator.get<SharedPreferences>();
       final token = sharedPref.getString(ApiConstants.tokenKey);
        if(token != null) options.headers[ApiConstants.tokenKey] = token;
        return handler.next(options);
      },
    ));
    return dio;
  }

  @preResolve
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();
}