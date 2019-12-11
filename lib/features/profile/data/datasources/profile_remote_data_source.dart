import 'package:flutter/services.dart';
import 'package:projsoftware/core/exception.dart';
import 'package:projsoftware/model/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

// Define interface do Acesso a base de dados remoto
abstract class ProfileRemoteDataSource {
  Future<void> setProfile(String userId, String newProfile);
  Future<String> getProfile(String userId);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  // Nome da coleção, ou PATH de onde estão os usuário no BD
  final String _collectionName = "USUARIOS";
  // Instancia do controlador da Base da Dados do Firebase
  final FirebaseDatabase firebaseDatabase;

  ProfileRemoteDataSourceImpl({this.firebaseDatabase});

  @override
  Future<String> getProfile(String userId) async {
    UserModel userModel;
    try {
      // Pega o Snapshot do usuário no BD
      DataSnapshot snapshot = await firebaseDatabase
          .reference()
          .child(_collectionName)
          .child(userId)
          .once();

      // Cria um usuário a partir do Snapshot
      userModel = UserModel.fromDataSnapshot(snapshot);

    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }

    // Caso o usuário tenha um perfil definido
    if (userModel != null && userModel.profile != null) {
      return userModel.profile;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> setProfile(String userId, String newProfile) async {
    try {
      //Altera o perfil na base de dados
      await firebaseDatabase.reference().child(_collectionName).child(userId).update(
        {
          'perfil': newProfile,
        },
      );
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException();
    }
  }
}
