import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class LoginLocalDataSource {
  Future<void> cacheUserToken(String token);
}

const CACHED_USER_TOKEN = 'CACHED_USER_TOKEN';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUserToken(String token) {
    return sharedPreferences.setString(CACHED_USER_TOKEN, token);
  }
}
