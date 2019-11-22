import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/profiles.dart';


class JackOfAllTrades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildJackOfAllTradesScreen();
  }

  Widget _buildJackOfAllTradesScreen() {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: Profiles.semTempoRuim(),
            onTap: () {               
              debugPrint("ruim");
            },
          ),
        ],
      ),
    );
  }
}
