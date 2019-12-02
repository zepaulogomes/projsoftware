import 'login_user.dart';
import 'package:meta/meta.dart';

class LoginUserModel extends LoginUser {
  LoginUserModel({@required user, @required password})
      : super(user: user, password: password);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (user != null) {
      bool isNumber = int.tryParse(user.substring(0, 1)) != null;
      if (isNumber)
        json['username'] = user.replaceAll(".", "").replaceAll("-", "");
      else
        json['email'] = user;
    }
    if (password != null) json['password'] = password;
    return json;
  }

  factory LoginUserModel.fromEntity(LoginUser user) {
    if (user == null) return null;
    return LoginUserModel(
      user: user.user,
      password: user.password,
    );
  }
}
