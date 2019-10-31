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
            flex: 4,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
            child: Row(
              children: <Widget>[
                // Text(
                //   "ESTUD",
                //   style: TextStyle(
                //       fontFamily: 'RobotoMono-Light',
                //       fontWeight: FontWeight.w100,
                //       fontSize: 50),
                // ),
                // Text(
                //   "UFF",
                //   style: TextStyle(
                //       fontFamily: 'RobotoMono-Bold',
                //       fontWeight: FontWeight.bold,
                //       fontSize: 50),
                // ),
                Image(
                  image: AssetImage(
                      'assets/images/logo.png'),
                )
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.email),
              labelText: 'Insira seu e-mail',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 5.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.lock_outline),
                labelText: 'Insira sua senha',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
              color: Color.fromRGBO(33, 102, 204, 1),
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              splashColor: Colors.blueAccent,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              onPressed: () {
                /*...*/
              },
              child: Text(
                "ENTRAR",
                style: TextStyle(
                  fontSize: 20.0,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
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
