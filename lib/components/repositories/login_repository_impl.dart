import 'package:dartz/dartz.dart';
import 'network_info.dart';
import 'login_local_data_source.dart';
import 'login_remote_data_source.dart';
import 'login_user_model.dart';
import 'login_user.dart';
import 'package:meta/meta.dart';
import 'login_repository.dart';
import 'failure.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginLocalDataSource localDataSource;
  final LoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {@required this.localDataSource,
      @required this.remoteDataSource,
      @required this.networkInfo});

 
  Future<Either<Failure, String>> makeLogin(LoginUser user) async {
    if (await networkInfo.isConnected) {
      final String tokenToSave =
          await remoteDataSource.makeLogin(LoginUserModel.fromEntity(user));
      localDataSource.cacheUserToken(tokenToSave);
      return Right(tokenToSave);
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  Object get override => override;
}
