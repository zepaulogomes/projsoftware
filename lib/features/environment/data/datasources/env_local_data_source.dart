import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class EnvLocalDataSource {
  Future<void> cacheUserToken(String token);
}

const CACHED_USER_TOKEN = 'CACHED_USER_TOKEN';

class EnvLocalDataSourceImpl implements EnvLocalDataSource {
  final SharedPreferences sharedPreferences;

  EnvLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUserToken(String token) {
    return sharedPreferences.setString(CACHED_USER_TOKEN, token);
  }
}