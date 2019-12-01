import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginUser extends Equatable {
  final String user;
  final String password;

  LoginUser({@required this.user, @required this.password});

  @override
  List<Object> get props => [user, password];
}
