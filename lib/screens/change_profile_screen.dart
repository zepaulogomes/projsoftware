import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/profile_card.dart';

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
          ProfileCard.loboSolitario(),
          ProfileCard.semTempoRuim(),
          ProfileCard.daGalera(),
        ],
      ),
    );
  }
}
