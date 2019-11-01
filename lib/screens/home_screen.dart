import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _toLogin = true;
  bool toRegister = false;
  @override
  Widget build(BuildContext context) {
    return _buildHomeScreen(context);
  }

  Widget _buildHomeScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 20),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: height * 0.15,
          ),
          Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/logo.png'),
              )
            ],
          ),
          // Menu
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _toLogin = true;
                  });
                  debugPrint("Login:" + _toLogin.toString());
                },
                child: (_toLogin
                    ? _buildLoginSelected()
                    : _buildLoginDiselected()),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _toLogin = false;
                  });
                  debugPrint("Login:" + _toLogin.toString());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                  child: Text(
                    'Registro',
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
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
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.lock_outline),
              labelText: 'Insira sua senha',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 5.0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
        ],
      ),
    );
  }

  Widget _buildLoginSelected() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3.0,
            color: Color.fromRGBO(33, 102, 204, 1),
          ),
        ),
      ),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget _buildLoginDiselected() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 25, color: Colors.grey),
      ),
    );
  }

  Widget _buildRegisterSelected() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3.0,
            color: Color.fromRGBO(33, 102, 204, 1),
          ),
        ),
      ),
      child: Text(
        'Registro',
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget _buildRegisterDiselected() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
      child: Text(
        'Registro',
        style: TextStyle(fontSize: 25, color: Colors.grey),
      ),
    );
  }

}
