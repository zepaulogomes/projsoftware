import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projsoftware/features/environment/data/datasources/env_remote_data_source.dart';
import 'package:projsoftware/model/environment_model.dart';
import 'package:projsoftware/values/strings.dart';

class Outgoing extends StatelessWidget {
  final List<Marker> outGoingMarkers = [];

  @override
  Widget build(BuildContext context) {
    EnvRemoteDataSource dataSource = EnvRemoteDataSourceImpl();
    List<EnvironmentModel> envList =
        dataSource.getByProfile(StringValues.OUTGOING);
    for (EnvironmentModel env in envList) {
      outGoingMarkers.add(env.toMarker());
    }

    return _buildOutgoingScreen(context);
  }

  Widget _buildOutgoingScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      appBar: AppBar(),
      drawer: new AppDrawer(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: Profiles.daGalera(),
          ),
          SizedBox(
            width: width,
            height: height,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  bearing: 200.00,
                  target: LatLng(-22.9060, -43.1323),
                  zoom: 16.5),
              markers: Set.from(outGoingMarkers),
            ),
          ),
        ],
      ),
    );
  }
}
