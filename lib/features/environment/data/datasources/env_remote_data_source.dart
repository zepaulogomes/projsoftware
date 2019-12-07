import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:projsoftware/core/exception.dart';
import 'package:projsoftware/model/user_model.dart';

abstract class EnvRemoteDataSource {
  Future<UserModel> signIn(String email, String password);

  Future<String> signUp(
      String name, String course, String email, String password);

  Future<void> signOut();
}

class EnvRemoteDataSourceImpl implements EnvRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseDatabase firebaseDatabase;

  EnvRemoteDataSourceImpl(
      {@required this.firebaseAuth, @required this.firebaseDatabase});
  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      //implementar
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> signOut() {
    try {
      //implementar
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> signUp(
      String name, String course, String email, String password) async {
    String userId;
    try {
      //implementar
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }
  }
}
