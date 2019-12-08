import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

class CourseModel extends Equatable {
  final String _name;
  final String _grade;
  final String _mode;

  CourseModel(
    this._name,
    this._grade,
    this._mode,
  );

  factory CourseModel.fromDataSnapshot(DataSnapshot snapshot) {
    return CourseModel(
      snapshot.value["nome"],
      snapshot.value["grau"],
      snapshot.value["modalidade"],
    );
  }

  String get name => _name;
  String get grade => _grade;
  String get mode => _mode;

  @override
  List<Object> get props => [_name, _grade, _mode];
}
