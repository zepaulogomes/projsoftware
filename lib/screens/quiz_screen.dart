import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EstudUFF"),
      ),
      body: _buildHomeScreen(context),
    );
  }

  Widget _buildHomeScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: height * 0.08,
                width: width,
                color: Colors.white,
                decoration: ,
              )
            ],
          ),
        ],
      ),
    );
  }
}
