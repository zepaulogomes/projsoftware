import 'package:dartz/dartz.dart';
import 'login_user.dart';
import 'failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> makeLogin(LoginUser user);
}
