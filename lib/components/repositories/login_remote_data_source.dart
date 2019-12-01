import 'dart:convert';

import 'settings.dart';
import 'login_user_model.dart';
import 'exception.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<String> makeLogin(LoginUserModel user);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;
  final Settings settings;

  LoginRemoteDataSourceImpl({@required this.client, @required this.settings});
  @override
  Future<String> makeLogin(LoginUserModel user) async {
    http.Response response;
    try {
      response = await client.post(
        settings.getUrl("url"),
        headers: settings.getHeaders(),
        body: json.encode(user.toJson()),
      );
    } catch (e) {
      print(e.toString());
      print((response == null) ? "Response is null" : response.body);
      throw ServerException();
    }
    if (response.statusCode == 200) {
      return json.decode(response.body)["key"];
    } 
  } 
}
