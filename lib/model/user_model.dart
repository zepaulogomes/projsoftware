import 'package:flutter/material.dart';
import 'package:projsoftware/model/subject_model.dart';

class UserModel {
  final String _code;
  final String _name;
  final String _course;
  final List<SubjectModel> _subjects;

  UserModel(
    this._code,
    this._name,
    this._course,
    this._subjects,
  );
  }