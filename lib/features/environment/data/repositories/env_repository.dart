import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/core/network_info.dart';
import 'package:projsoftware/features/environment/data/datasources/env_local_data_source.dart';
import 'package:projsoftware/features/environment/data/datasources/env_remote_data_source.dart';
import 'package:projsoftware/model/environment_model.dart';

abstract class EnvRepository {
  Future<Either<Failure, String>> filtterByType();
  Future<Either<Failure, String>> filtterByProfile();
  Future<Either<Failure, String>> noFiltter();
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
  Future<Either<Failure, String>> filtterByType() async {
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
  Future<Either<Failure, String>> filtterByProfile() async {
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
  Future<Either<Failure, String>> noFiltter() async {
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
