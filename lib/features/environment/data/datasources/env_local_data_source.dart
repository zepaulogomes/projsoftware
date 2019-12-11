import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class EnvLocalDataSource {
  Future<String> getUserProfile();
  Future<String> getUserToken();

}

const CACHED_USER_PROFILE = 'CACHED_USER_PROFILE';
const CACHED_USER_TOKEN = 'CACHED_USER_TOKEN';

class EnvLocalDataSourceImpl implements EnvLocalDataSource {
  final SharedPreferences sharedPreferences;

  EnvLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<String> getUserProfile() async{
    return sharedPreferences.getString(CACHED_USER_PROFILE);
  }

  @override
  Future<String> getUserToken() async{
    return sharedPreferences.getString(CACHED_USER_TOKEN);;
  }
}