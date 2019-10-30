import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildHomeScreen();
  }

  Widget _buildHomeScreen() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 20),
      child: Column(
        children: <Widget>[
          Spacer(
            flex: 3,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0,0.0, 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  "ESTUD",
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Text(
                  "UFF",
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Insira seu e-mail',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 5.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0,20.0, 0.0,0.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Insira sua senha',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
            ),
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
