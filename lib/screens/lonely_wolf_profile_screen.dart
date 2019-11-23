import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profiles.dart';

class LonelyWolf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildLonenlyWolfScreen();
  }

  Widget _buildLonenlyWolfScreen() {
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
        ],
      ),
    );
  }
}
