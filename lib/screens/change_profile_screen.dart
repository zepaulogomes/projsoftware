import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/profile_card.dart';
import 'package:projsoftware/features/environment/presentation/screens/jack_of_all_trades_screen.dart';
import 'package:projsoftware/features/environment/presentation/screens/lonely_wolf_profile_screen.dart';
import 'package:projsoftware/features/environment/presentation/screens/outgoing_screen.dart';


class ChangeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildChangeProfileScreen(context);
  }

  Widget _buildChangeProfileScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: ProfileCard.loboSolitario(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LonelyWolf()),
              );
            },
          ),
          GestureDetector(
            child: ProfileCard.semTempoRuim(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JackOfAllTrades()),
              );
            },
          ),
          GestureDetector(
            child: ProfileCard.daGalera(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Outgoing()),
              );
            },
          ),
        ],
      ),
    );
  }
}
