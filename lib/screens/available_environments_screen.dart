import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projsoftware/components/UI/profiles.dart';

class AvailableEnvironment extends StatelessWidget {
  final List<Marker> jackAllTradesMarkers = [];
  @override
  Widget build(BuildContext context) {
        jackAllTradesMarkers.add(
      Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          debugPrint('marker tapped');
        },
        position: LatLng(-22.906382, -43.133637),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );
    jackAllTradesMarkers.add(
      Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          debugPrint('marker tapped');
        },
        position: LatLng(-22.906382, -43.132860),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
        jackAllTradesMarkers.add(
      Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          debugPrint('marker tapped');
        },
        position: LatLng(-22.906790, -43.132859)
      ),
    );
    
    return _buildAvailableEnvironmentScreen(context);
  }

  Widget _buildAvailableEnvironmentScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: Profiles.ambientesDisponiveis(),
            onTap: () {
              debugPrint("ruim");
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
              markers: Set.from(jackAllTradesMarkers),
            ),
          ),
        ],
      ),
    );
  }

  static ambientesDisponiveis() {}
}
