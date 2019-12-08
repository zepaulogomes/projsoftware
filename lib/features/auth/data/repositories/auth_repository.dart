import 'dart:ffi';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:projsoftware/core/exception.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/core/network_info.dart';
import 'package:projsoftware/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:projsoftware/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:projsoftware/model/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signIn(String email, String password);
  Future<Either<Failure, String>> signUp(
      String email, String password, String name, String course);
  Future<Either<Failure, void>> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, UserModel>> signIn(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = await remoteDataSource.signIn(email, password);
        localDataSource.cacheUserToken(userModel.code);

        return Right(userModel);
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
        String userId =
            await remoteDataSource.signUp(name, course, email, password);
        localDataSource.cacheUserToken(userId);
        return Right(userId);
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
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.cleanCache();
      return Right(Void());
    } on PlatformException catch (e) {
      return Left(PlatformFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
