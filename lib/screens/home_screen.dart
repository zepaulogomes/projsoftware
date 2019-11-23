import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';

import 'package:projsoftware/components/UI/text_field.dart';
import 'package:projsoftware/screens/quiz_screen.dart';
import 'package:projsoftware/values/strings.dart';

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
    return Scaffold(
      body: Container(
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
            (_toLogin ? _buildLogin() : _buildRegister()),
          ],
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _toLogin = true;
                });
              },
              child:
                  (_toLogin ? _buildLoginSelected() : _buildLoginDiselected()),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _toLogin = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                child: (_toLogin
                    ? _buildRegisterDiselected()
                    : _buildRegisterSelected()),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TextFieldInput.email(StringValues.EMAIL_PLACEHOLDER),
        SizedBox(
          height: 20,
        ),
        TextFieldInput.senha(StringValues.PASSWORD_PLACEHOLDER),
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
              StringValues.LOGIN_BUTTON_TITLE,
              style: TextStyle(
                fontFamily: 'Rubik',
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
    );
  }

  Widget _buildRegister() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _toLogin = true;
                });
              },
              child:
                  (_toLogin ? _buildLoginSelected() : _buildLoginDiselected()),
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
                child: (_toLogin
                    ? _buildRegisterDiselected()
                    : _buildRegisterSelected()),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TextFieldInput.texto(StringValues.NAME_PLACEHOLDER, Icons.person_outline),
        SizedBox(
          height: 20,
        ),
        TextFieldInput.email(StringValues.EMAIL_PLACEHOLDER),
        SizedBox(
          height: 20,
        ),
        TextFieldInput.senha(StringValues.PASSWORD_PLACEHOLDER),
        SizedBox(
          height: 20,
        ),
        TextFieldInput.texto(
            StringValues.COURSE_PLACEHOLDER, Icons.import_contacts),
        SizedBox(
          height: 20,
        ),
        TextFieldInput.texto(
            StringValues.LECTURES_PLACEHOLDER, Icons.arrow_drop_down),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizScreen()),
              );
            },
            child: Text(
              StringValues.REGISTER_BUTTON_TITLE,
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
        StringValues.LOGIN_TITLE,
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget _buildLoginDiselected() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
      child: Text(
        StringValues.LOGIN_TITLE,
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
        StringValues.REGISTER_TITLE,
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget _buildRegisterDiselected() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
      child: Text(
        StringValues.REGISTER_TITLE,
        style: TextStyle(fontSize: 25, color: Colors.grey),
      ),
    );
  }
}
