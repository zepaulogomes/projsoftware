import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Outgoing extends StatelessWidget {
  final List<Marker> outGoingMarkers = [];

  @override
  Widget build(BuildContext context) {
    outGoingMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          debugPrint('marker tapped');
        },
        position: LatLng(-22.906382, -43.133637)));
    outGoingMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          debugPrint('marker tapped');
        },
        position: LatLng(-22.906797, -43.132859)));
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
            onTap: () {
              debugPrint("tempo bom");
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
              markers: Set.from(outGoingMarkers),
            ),
          ),
        ],
      ),
    );
  }
}
