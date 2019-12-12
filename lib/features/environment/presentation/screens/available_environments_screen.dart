import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/profiles.dart';



class AvailableEnvironment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildAvailableEnvironmentScreen();
  }

  Widget _buildAvailableEnvironmentScreen() {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: Profiles.ambientesDisponiveis(),
          ),
        ],
      ),
    );
  }
}

