import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/core/network_info.dart';
import 'package:projsoftware/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:projsoftware/features/profile/data/datasources/profile_remote_data_source.dart';

abstract class ProfileRepository {
  Future<Either<Failure, String>> setProfile(String userCode, String profile);
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
    if (await networkInfo.isConnected) {
      try {} on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> setProfile(
      String userCode, String profile) async {
    if (await networkInfo.isConnected) {
      try {} on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
