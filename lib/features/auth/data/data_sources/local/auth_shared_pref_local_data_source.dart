import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefLocalDataSource  implements AuthLocalDataSource{

  @override
  Future<void> saveToken(String token) async{
    final sharedPref = await SharedPreferences.getInstance();
   await sharedPref.setString(CacheConstants.token, token);
  }

  @override
  Future<String> getToken() async{
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(CacheConstants.token)!;
  }
}