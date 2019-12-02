import 'package:dartz/dartz.dart';
import 'package:projsoftware/core/failure.dart';
import 'login_user.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> makeLogin(LoginUser user);
}
