import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projsoftware/model/subject_model.dart';

class UserModel extends Equatable {
  final String _code;
  final String _name;
  final String _course;
  final List<SubjectModel> _subjects = null;
  final String _profile;

  UserModel(this._code, this._name, this._course, this._profile);

  factory UserModel.fromDataSnapshot(DataSnapshot snapshot) {
    return UserModel(
      snapshot.key,
      snapshot.value["nome"],
      snapshot.value["curso"],
      snapshot.value["perfil"],
    );
  }

  String get name => _name;
  String get code => _code;
  String get course => _course;
  String get profile => _profile;

  @override
  List<Object> get props => [_code, _name, _course, _subjects, _profile];
}
