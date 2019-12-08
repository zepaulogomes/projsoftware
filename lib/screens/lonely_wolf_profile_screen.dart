import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LonelyWolf extends StatelessWidget {
  final List<Marker> lonelyWolfMarkers = [];

  @override
  Widget build(BuildContext context) {
    lonelyWolfMarkers.add(Marker(
      markerId: MarkerId('myMarker' ),
      draggable: false,
      onTap: () {
        debugPrint('marker tapped');
      },
      position: LatLng(-22.906382, -43.133637),
            icon:
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ));
          lonelyWolfMarkers.add(Marker(
      markerId: MarkerId('myMarker' ),
      draggable: false,
      onTap: () {
        debugPrint('marker tapped');
      },
      position: LatLng(-22.906797, -43.132859),
      icon:
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ));
    return _buildLonenlyWolfScreen(context);
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
              target: LatLng(-22.8808,  -43.1043),
              zoom: 11.0
              ),
              markers: Set.from(lonelyWolfMarkers),
            ),
          ),
        ],
      ),
    );
  }
}
