import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class ProfileLocalDataSource {
  Future<void> cacheUserProfile(String token);

}

const CACHED_USER_PROFILE = 'CACHED_USER_PROFILE';

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUserProfile(String profile) {
    return sharedPreferences.setString(CACHED_USER_PROFILE, profile);
  }
}