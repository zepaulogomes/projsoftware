import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LonelyWolf extends StatelessWidget {

  // Completer<GoogleMapController> _controller = Completer();
  // static const LatLng _center =
  //     const LatLng(-22.8808,  -43.1043);
  // final Set<Marker> _markers = {};
  // LatLng _lastMapPosition = _center;
  // MapType _currentMapType = MapType.normal;

  // _onMapCreated(GoogleMapController controller) {
  //   _controller.complete(controller);
  // }

  // _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }

  // Widget button(Function function, IconData icon) {
  //   return FloatingActionButton(
  //     onPressed: function,
  //     materialTapTargetSize: MaterialTapTargetSize.padded,
  //     backgroundColor: Colors.blue,
  //     child: Icon(icon, size: 36.0),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return _buildLonenlyWolfScreen(context);
  }

  Widget _buildLonenlyWolfScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            height: 500,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
              target: LatLng(-22.8808,  -43.1043),
              zoom: 12.0
              ),
            ),
          ),
        ],
      ),
    );
  }
}
