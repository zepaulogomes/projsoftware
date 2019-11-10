import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/text_field.dart';

import 'package:projsoftware/values/strings.dart';
import 'package:projsoftware/values/colors.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          TextFieldInput.texto(StringValues.PLACEHOLDER_OPTION, Icons.arrow_drop_down),
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
          TextFieldInput.texto(StringValues.PLACEHOLDER_OPTION, Icons.arrow_drop_down),
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
          TextFieldInput.texto(StringValues.PLACEHOLDER_OPTION, Icons.arrow_drop_down),
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
                /*...*/
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
}
