import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

import '../../../../core/exception.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUserToken(String token);
  Future<bool> cleanCache();
}

const CACHED_USER_TOKEN = 'CACHED_USER_TOKEN';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUserToken(String token) {
    return sharedPreferences.setString(CACHED_USER_TOKEN, token);
  }

  @override
  Future<bool> cleanCache() {
    try{
       return sharedPreferences.clear();
    } catch (e) {
      throw CacheException();
    }
  }
}