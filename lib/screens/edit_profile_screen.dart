import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/text_field.dart';
import 'package:projsoftware/screens/quiz_screen.dart';
import 'package:projsoftware/values/strings.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildEditProfileScreen(context);
  }

  Widget _buildEditProfileScreen(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      drawer: new AppDrawer(),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: height * 0.05,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
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
                        StringValues.EDIT_ACCOUNT,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      width: 20,
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
                      StringValues.EDIT_ACCOUNT_BUTTON_TITLE,
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
          ],
        ),
      ),
    );
  }
}
