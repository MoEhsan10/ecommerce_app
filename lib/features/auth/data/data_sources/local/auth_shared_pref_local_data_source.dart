import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as:AuthLocalDataSource)
class AuthSharedPrefLocalDataSource  implements AuthLocalDataSource{

  final SharedPreferences sharedPref;

  AuthSharedPrefLocalDataSource({required this.sharedPref});

  @override
  Future<void> saveToken(String token) async{
    try{
      await sharedPref.setString(CacheConstants.token, token);
    }catch (exception){
      throw  LocalException(message: 'Failed to save token');
    }
  }

  @override
  Future<String> getToken() async{
    try{
      return sharedPref.getString(CacheConstants.token)!;
    }catch(exception){
      throw LocalException(message: 'Failed to get token');
    }
  }
}
