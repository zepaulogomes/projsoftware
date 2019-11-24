import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Outgoing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildOutgoingScreen();
  }

  Widget _buildOutgoingScreen() {
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
        ],
      ),
    );
  }
}
