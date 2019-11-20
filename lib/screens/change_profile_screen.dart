import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/profile_card.dart';
import 'package:projsoftware/values/colors.dart';
import 'package:projsoftware/values/strings.dart';


class ChangeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildChangeProfileScreen();
  }

  Widget _buildChangeProfileScreen() {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: ProfileCard.loboSolitario(),
            
            onTap: () {
              debugPrint("a ruim");
            },
          ),
          GestureDetector(
            child: ProfileCard.semTempoRuim(),
            onTap: () {
              debugPrint("tempo ruim");
            },
          ),
          GestureDetector(
            child: ProfileCard.daGalera(),
            onTap: () {
              debugPrint("da galera");
            },
          ),
        ],
      ),
    );
  }
}