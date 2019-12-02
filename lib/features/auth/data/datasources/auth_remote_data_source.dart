import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:projsoftware/core/exception.dart';
import 'package:projsoftware/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn(String email, String password);

  Future<String> signUp(
      String name, String course, String email, String password);

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String _collectionName = "USUARIOS";
  final FirebaseAuth firebaseAuth;
  final FirebaseDatabase firebaseDatabase;

  AuthRemoteDataSourceImpl(
      {@required this.firebaseAuth, @required this.firebaseDatabase});
  @override
  Future<UserModel> signIn(String email, String password) async {
    UserModel userModel;
    try {
      AuthResult result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      String userId = result.user.uid;
      DataSnapshot snapshot = await firebaseDatabase
          .reference()
          .child(_collectionName)
          .child(userId)
          .once();

      userModel = UserModel.fromDataSnapshot(snapshot);
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      print("[AuthRemoteDataSource] ${e.toString()}");
      throw ServerException();
    }

    if (userModel == null) {
      throw ServerException();
    } else {
      return userModel;
    }
  }

  @override
  Future<void> signOut() {
    try {
      firebaseAuth.signOut();
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
      AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      userId = result.user.uid;
      firebaseDatabase.reference().child(_collectionName).child(userId).set(
        {
          'nome': name,
          'curso': course,
        },
      );
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      print("[AuthRemoteDataSource] ${e.toString()}");
      throw ServerException();
    }

    if (userId != null) {
      return userId;
    } else {
      throw ServerException();
    }
  }
}
