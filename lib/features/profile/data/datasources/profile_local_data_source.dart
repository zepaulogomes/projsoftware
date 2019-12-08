import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class ProfileLocalDataSource {
  Future<void> cacheUserProfile(String token);
  Future<String> getUserProfile();
  Future<String> getUserToken();

}

const CACHED_USER_PROFILE = 'CACHED_USER_PROFILE';
const CACHED_USER_TOKEN = 'CACHED_USER_TOKEN';

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUserProfile(String profile) {
    return sharedPreferences.setString(CACHED_USER_PROFILE, profile);
  }

  @override
  Future<String> getUserProfile() async{
    return sharedPreferences.getString(CACHED_USER_PROFILE);
  }

  @override
  Future<String> getUserToken() async{
    return sharedPreferences.getString(CACHED_USER_TOKEN);;
  }
}