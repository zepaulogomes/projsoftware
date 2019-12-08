import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/profile_dialog.dart';
import 'package:projsoftware/values/strings.dart';
import 'package:projsoftware/values/colors.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _quiet, _privacy, _behavior;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(context),
      body: _buildHomeScreen(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        StringValues.QUIZ_APPBAR_TITLE,
        style: TextStyle(color: ColorValues.grey),
      ),
      iconTheme: IconThemeData(color: ColorValues.grey),
    );
  }

  Widget _buildHomeScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 20),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            StringValues.QUIZ_INTRODUCTION_TEXT,
            style: TextStyle(
              color: ColorValues.grey,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          // FIRST STATEMENT
          Text(
            StringValues.QUIET_PLACE_STATEMENT,
            style: TextStyle(
              color: ColorValues.black,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButton<String>(
            hint: Text(StringValues.PLACEHOLDER_OPTION),
            value: _quiet == null
                ? null
                : StringValues.QUIZ_ANSWERS_OPTIONS[_quiet],
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (String valor) {
              setState(() {
                _quiet = StringValues.QUIZ_ANSWERS_OPTIONS.indexOf(valor);
              });
            },
            items: StringValues.QUIZ_ANSWERS_OPTIONS
                .map<DropdownMenuItem<String>>((String valor) {
              return DropdownMenuItem<String>(
                value: valor,
                child: Text(valor),
              );
            }).toList(),
          ),
          SizedBox(
            height: 30,
          ),
          // SECOND STATEMENT
          Text(
            StringValues.PRIVATE_PLACE_STATEMENT,
            style: TextStyle(
              color: ColorValues.black,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButton<String>(
            hint: Text(StringValues.PLACEHOLDER_OPTION),
            value: _privacy == null
                ? null
                : StringValues.QUIZ_ANSWERS_OPTIONS[_privacy],
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (String valor) {
              setState(() {
                _privacy = StringValues.QUIZ_ANSWERS_OPTIONS.indexOf(valor);
              });
            },
            items: StringValues.QUIZ_ANSWERS_OPTIONS
                .map<DropdownMenuItem<String>>((String valor) {
              return DropdownMenuItem<String>(
                value: valor,
                child: Text(valor),
              );
            }).toList(),
          ),
          SizedBox(
            height: 30,
          ),
          // THIRD STATEMENT
          Text(
            StringValues.STUDY_BEHAVIOR_STATEMENT,
            style: TextStyle(
              color: ColorValues.black,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // TextFieldInput.texto(StringValues.PLACEHOLDER_OPTION, Icons.arrow_drop_down),
          DropdownButton<String>(
            hint: Text(StringValues.PLACEHOLDER_OPTION),
            value: _behavior == null
                ? null
                : StringValues.QUIZ_ANSWERS_OPTIONS[_behavior],
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (String valor) {
              setState(() {
                _behavior = StringValues.QUIZ_ANSWERS_OPTIONS.indexOf(valor);
              });
            },
            items: StringValues.QUIZ_ANSWERS_OPTIONS
                .map<DropdownMenuItem<String>>((String valor) {
              return DropdownMenuItem<String>(
                value: valor,
                child: Text(valor),
              );
            }).toList(),
          ),
          SizedBox(
            height: 30,
          ),
          // BUTTON
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
                _calculateProfile();
              },
              child: Text(
                StringValues.SUBMIT_BUTTON_TITLE,
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
      ),
    );
  }

  void _calculateProfile() {
    int profile;
    if (_quiet != null && _privacy != null && _behavior != null) {
      profile = _quiet + _privacy + _behavior;
      _showQuizResult(profile);
    } else {
      SnackBar snackBar = new SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icon(Icons.warning),
            Icon(Icons.error_outline),
            SizedBox(width: 5,),
            Text(
              StringValues.ERROR_MESSAGE,
              style: TextStyle(fontSize: 20, color: Colors.white,),
            ),
          ],
        ),
        duration: Duration(
          seconds: 3,
        ),
        backgroundColor: Colors.red,
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
      debugPrint("Null");
    }
  }

  void _showQuizResult(int profile) {
    if (profile < 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog.daGalera();
        },
      );
    } else if (profile >= 5 && profile <= 7) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog.semTempoRuim();
        },
      );
    } else if (profile > 7) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog.loboSolitario();
        },
      );
    }
  }
}
