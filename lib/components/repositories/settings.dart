import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

class Settings {
  static const String _DEBUG_MODE = "debug";
  static const String _RELEASE_MODE = "release";
  static final String _baseUrlRelease =
      "url";
  static final String _baseUrlDevelop = "http://10.0.2.2:8000/";

  static final String _mode = _RELEASE_MODE;

  final SharedPreferences sharedPreferences;

  Settings({@required this.sharedPreferences});

  String getUrl(String params) {
    String baseUrl = (_mode == _DEBUG_MODE) ? _baseUrlDevelop : _baseUrlRelease;

    if (params == null) return null;
    return "$baseUrl$params";
  }

  Map<String, String> getHeaders({bool withToken = false}) {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (withToken && sharedPreferences.containsKey("CACHED_USER_TOKEN")) {
      headers.addAll({
        'Authorization': "token ${sharedPreferences.get("CACHED_USER_TOKEN")}"
      });
    }

    return headers;
  }
}
