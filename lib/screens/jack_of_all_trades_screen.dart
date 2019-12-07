import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';

class JackOfAllTrades extends StatelessWidget {
  List<Marker> jackAllTradesMarkers = [];

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
        position: LatLng(-22.906797, -43.132859),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );
    return _buildJackOfAllTradesScreen(context);
  }

  Widget _buildJackOfAllTradesScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      appBar: AppBar(),
      drawer: new AppDrawer(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: Profiles.semTempoRuim(),
            onTap: () {
              debugPrint("ruim");
            },
          ),
          SizedBox(
            width: width,
            height: height,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(-22.8808, -43.1043), zoom: 12.0),
              markers: Set.from(jackAllTradesMarkers),
            ),
          ),
        ],
      ),
    );
  }
}
