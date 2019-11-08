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
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.grey,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          "Questionário",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                blurRadius: 5.0,
                                color: Colors.grey,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
