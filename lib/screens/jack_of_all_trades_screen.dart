import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';


class JackOfAllTrades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            ),
          ),
        ],
      ),
    );
  }
}
