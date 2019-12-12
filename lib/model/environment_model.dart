import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projsoftware/values/strings.dart';

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

  Marker toMarker() {
    Marker m;
    switch (this.profile) {
      case StringValues.OUTGOING:
        m = Marker(
          markerId: MarkerId(this.code),
          draggable: false,
          position: LatLng(this.latitude, this.longitude),
        );
        break;
      case StringValues.LONELY_WOLF:
        m = Marker(
          markerId: MarkerId(this.code),
          draggable: false,
          position: LatLng(this.latitude, this.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        );
        break;
      case StringValues.JACK_OF_ALL_TRADES:
        m = Marker(
          markerId: MarkerId(this.code),
          draggable: false,
          position: LatLng(this.latitude, this.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        );
        break;
    }

    return m;
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
