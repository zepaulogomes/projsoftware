import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/core/exception.dart';
import 'package:projsoftware/core/network_info.dart';
import 'package:projsoftware/model/environment_model.dart';
import 'package:projsoftware/features/environment/data/datasources/env_local_data_source.dart';
import 'package:projsoftware/features/environment/data/datasources/env_remote_data_source.dart';

abstract class EnvRepository {
  Future<Either<Failure, List<EnvironmentModel>>> getByType(String type);
  Future<Either<Failure, List<EnvironmentModel>>> getByProfile(String profile);
  Future<Either<Failure, List<EnvironmentModel>>> getAll();
  Future<Either<Failure, EnvironmentModel>> getSingleEnvironment(String code);
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
  Future<Either<Failure, List<EnvironmentModel>>> getByType(String type) async {
    List<EnvironmentModel> enviromentList;

    if (await networkInfo.isConnected) {
      try {
        String userToken = await localDataSource.getUserToken();
        if (userToken != null) {
          String userProfile = await localDataSource.getUserProfile();
          if (userProfile != null) {
            enviromentList = await remoteDataSource.getByType(type);
            if (enviromentList != null && enviromentList.length > 0) {
              return Right(enviromentList);
            } else {
              return Left(NullEnvironmentFailure());
            }
          } else {
            return Left(NullProfileFailure());
          }
        } else {
          return Left(InvalidTokenFailure());
        }
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } on NullEnvironmentException {
        return Left(NullEnvironmentFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<EnvironmentModel>>> getByProfile(
      String profile) async {
    List<EnvironmentModel> enviromentList;
    if (await networkInfo.isConnected) {
      try {
        String userToken = await localDataSource.getUserToken();
        if (userToken != null) {
          String userProfile = await localDataSource.getUserProfile();
          if (userProfile != null) {
            enviromentList = await remoteDataSource.getByProfile(profile);
            if (enviromentList != null && enviromentList.length > 0) {
              return Right(enviromentList);
            } else {
              return Left(NullEnvironmentFailure());
            }
          } else {
            return Left(NullProfileFailure());
          }
        } else {
          return Left(InvalidTokenFailure());
        }
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } on NullEnvironmentException {
        return Left(NullEnvironmentFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<EnvironmentModel>>> getAll() async {
    List<EnvironmentModel> enviromentList;
    if (await networkInfo.isConnected) {
      try {
        String userToken = await localDataSource.getUserToken();
        if (userToken != null) {
          String userProfile = await localDataSource.getUserProfile();
          if (userProfile != null) {
            enviromentList = await remoteDataSource.getAll();
            if (enviromentList != null && enviromentList.length > 0) {
              return Right(enviromentList);
            } else {
              return Left(NullEnvironmentFailure());
            }
          } else {
            return Left(NullProfileFailure());
          }
        } else {
          return Left(InvalidTokenFailure());
        }
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } on NullEnvironmentException {
        return Left(NullEnvironmentFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, EnvironmentModel>> getSingleEnvironment(
      String code) async {
    EnvironmentModel enviroment;
    if (await networkInfo.isConnected) {
      try {
        String userToken = await localDataSource.getUserToken();
        if (userToken != null) {
          String userProfile = await localDataSource.getUserProfile();
          if (userProfile != null) {
            enviroment = await remoteDataSource.getSingleEnvironment(code);
            if (enviroment != null) {
              return Right(enviroment);
            } else {
              return Left(NullEnvironmentFailure());
            }
          } else {
            return Left(NullProfileFailure());
          }
        } else {
          return Left(InvalidTokenFailure());
        }
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } on NullEnvironmentException {
        return Left(NullEnvironmentFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
