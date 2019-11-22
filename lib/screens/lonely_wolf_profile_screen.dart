import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/profiles.dart';


class LonelyWolf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildLonenlyWolfScreen();
  }

  Widget _buildLonenlyWolfScreen() {
    return Scaffold(
      appBar: AppBar(),
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
