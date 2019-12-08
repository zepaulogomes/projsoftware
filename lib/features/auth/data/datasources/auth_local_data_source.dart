import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';
import '../../../../core/exception.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUserToken(String token);
  Future<void> cacheUserName(String token);
  Future<void> cacheUserCourse(String token);
  Future<void> cacheUserProfile(String profile);
  Future<bool> cleanCache();
}

const CACHED_USER_TOKEN = 'CACHED_USER_TOKEN';
const CACHED_USER_NAME = 'CACHED_USER_NAME';
const CACHED_USER_COURSE = 'CACHED_USER_COURSE';
const CACHED_USER_PROFILE = 'CACHED_USER_PROFILE';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUserToken(String token) {
    return sharedPreferences.setString(CACHED_USER_TOKEN, token);
  }

  @override
  Future<void> cacheUserCourse(String course) {
    return sharedPreferences.setString(CACHED_USER_COURSE, course);
  }

  @override
  Future<void> cacheUserName(String name) {
    return sharedPreferences.setString(CACHED_USER_NAME, name);
  }

  @override
  Future<void> cacheUserProfile(String profile) {
    return sharedPreferences.setString(CACHED_USER_PROFILE, profile);
  }

  @override
  Future<bool> cleanCache() {
    try {
      return sharedPreferences.clear();
    } catch (e) {
      throw CacheException();
    }
  }
}