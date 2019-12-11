import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

class EnvironmentModel extends Equatable {
  final String code;
  final String campus;
  final String complement;
  final double latitude;
  final double longitude;
  final String name;
  final String profile;
  final String building;
  final String type;

  EnvironmentModel({
    this.code,
    this.campus,
    this.complement,
    this.latitude,
    this.longitude,
    this.name,
    this.profile,
    this.building,
    this.type,
  });

  factory EnvironmentModel.fromDataSnapshot(DataSnapshot snapshot) {
    return EnvironmentModel(
      code: snapshot.key,
      campus: snapshot.value["campus"],
      complement: snapshot.value["complemento"],
      latitude: snapshot.value["latitude"],
      longitude: snapshot.value["longitude"],
      name: snapshot.value["nome"],
      profile: snapshot.value["perfil"],
      building: snapshot.value["predio"],
      type: snapshot.value["tipo"],
    );
  }

  @override
  List<Object> get props => [
        code,
        name,
        complement,
        building,
        type,
        latitude,
        longitude,
        profile,
        campus,
      ];
}
