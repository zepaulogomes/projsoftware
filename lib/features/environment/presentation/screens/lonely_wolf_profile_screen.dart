import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projsoftware/features/environment/data/datasources/env_remote_data_source.dart';
import 'package:projsoftware/features/environment/presentation/bloc/bloc.dart';
import 'package:projsoftware/model/environment_model.dart';
import 'package:projsoftware/values/strings.dart';

class LonelyWolf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateLonelyWolf();
  EnvironmentState state;
}

class _StateLonelyWolf extends State<LonelyWolf> {

  final List<Marker> lonelyWolfMarkers = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    EnvRemoteDataSource dataSource = EnvRemoteDataSourceImpl();
    List<EnvironmentModel> envList = dataSource.getByProfile(StringValues.LONELY_WOLF);
    for (EnvironmentModel env in envList){
      lonelyWolfMarkers.add(env.toMarker());
    }
    
    return Scaffold(
      key: _scaffoldKey,
      drawer: new AppDrawer(),
      body: _buildLonenlyWolfScreen(context),
    );
  }

  Widget _buildLonenlyWolfScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.58;
    return Scaffold(
      appBar: AppBar(),
      drawer: new AppDrawer(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: Profiles.loboSolitario(),
            onTap: () {
              debugPrint("tempo ruim");
            },
          ),
          SizedBox(
            width: width,
            height: height,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  bearing: 200.00,
                  target: LatLng(-22.9060, -43.1323),
                  zoom: 16.5),
              markers: Set.from(lonelyWolfMarkers),
            ),
          ),
        ],
      ),
    );
  }
}
