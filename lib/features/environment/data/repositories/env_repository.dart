import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/core/network_info.dart';
import 'package:projsoftware/features/environment/data/datasources/env_local_data_source.dart';
import 'package:projsoftware/features/environment/data/datasources/env_remote_data_source.dart';
import 'package:projsoftware/model/user_model.dart';

abstract class EnvRepository {
  Future<Either<Failure, UserModel>> signIn(String email, String password);
  Future<Either<Failure, String>> signUp(
      String email, String password, String name, String course);
}

class EnvRepositoryImpl implements EnvRepository {
  final EnvRemoteDataSource remoteDataSource;
  final EnvLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  EnvRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, UserModel>> signIn(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        //implementar
        return Right(null);
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> signUp(
      String email, String password, String name, String course) async {
    if (await networkInfo.isConnected) {
      try {
        //implementar
        return Right(null);
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
