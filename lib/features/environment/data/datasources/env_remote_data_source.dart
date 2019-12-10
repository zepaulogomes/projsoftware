import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:projsoftware/core/exception.dart';
import 'package:projsoftware/model/environment_model.dart';

abstract class EnvRemoteDataSource {
  Future<List<EnvironmentModel>> filtterByType(String type);

  Future<List<EnvironmentModel>> filtterByProfile(String type);

  Future<List<EnvironmentModel>> noFiltter(String type);
}

class EnvRemoteDataSourceImpl implements EnvRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseDatabase firebaseDatabase;

  EnvRemoteDataSourceImpl(
      {@required this.firebaseAuth, @required this.firebaseDatabase});
      
  @override
  Future<List<EnvironmentModel>> filtterByType(String type) async {
    String resultFiltterByType;
    try {
      //return resultFiltterByType = type;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<EnvironmentModel>> filtterByProfile(String type) {
    String resultFiltterByProfile;
    try {
      //return resultFiltterByProfile = type;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<EnvironmentModel>> noFiltter(String type) async {
    String resultNoFiltter;
    try {
      //return resultNoFiltter = type;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }
  }
}
