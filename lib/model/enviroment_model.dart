import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

class EnviromentModel extends Equatable{
  final String _code;
  final String _name;
  final String _complement;
  final String _building;
  final String _type;
  final String _latitude;
  final String _longitude;
  final String _path;

  EnviromentModel(
    this._code,
    this._name,
    this._complement,
    this._building,
    this._type,
    this._latitude,
    this._longitude,
    this._path,
  );

  factory EnviromentModel.fromDataSnapshot(DataSnapshot snapshot){
    return EnviromentModel(
      snapshot.key,
      snapshot.value["campus"],
      snapshot.value["complemento"],
      snapshot.value["predio"],
      snapshot.value["tipo"],
      snapshot.value["latitude"],
      snapshot.value["longitude"],
      snapshot.value["perfil"]
    );
  }


  String get name => _name;
  String get code => _code;
  String get complement => _complement;
  String get building => _building;
  String get type => _type;
  String get latitude => _latitude;
  String get longitude => _longitude;
  String get path => _path;
  
  @override
  List<Object> get props => [_code, _name, _complement, _building, _type, _latitude, _longitude, _path];
}
