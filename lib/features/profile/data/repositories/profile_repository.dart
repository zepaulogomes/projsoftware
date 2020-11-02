import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:projsoftware/core/exception.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/core/network_info.dart';
import 'package:projsoftware/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:projsoftware/features/profile/data/datasources/profile_remote_data_source.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> setProfile(String userProfile);
  Future<Either<Failure, String>> getProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, String>> getProfile() async {
    String userProfile;
    try {
      String userToken = await localDataSource.getUserToken();
      if (userToken != null) {
        userProfile = await localDataSource.getUserProfile();
        if (userProfile != null) {
          // Retorna o perfil do usuário
          return Right(userProfile);
        } else {
          return Left(NullProfileFailure());
        }
      } else {
        return Left(InvalidTokenFailure());
      }
    } on PlatformException catch (e) {
      return Left(PlatformFailure(message: e.message));
    } on NullProfileException {
      return Left(NullProfileFailure());
    } on InvalidTokenException {
      return Left(InvalidTokenFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setProfile(String userProfile) async {
    try {
      String userToken = await localDataSource.getUserToken();
      if (userToken != null) {
        if (userProfile != null) {
          await localDataSource.cacheUserProfile(userProfile);

          return Right(
              await remoteDataSource.setProfile(userToken, userProfile));
        } else {
          return Left(NullProfileFailure());
        }
      } else {
        return Left(InvalidTokenFailure());
      }
    } on PlatformException catch (e) {
      return Left(PlatformFailure(message: e.message));
    } on NullProfileException {
      return Left(NullProfileFailure());
    } on InvalidTokenException {
      return Left(InvalidTokenFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
