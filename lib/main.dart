import 'package:flutter/material.dart';
import 'package:projsoftware/screens/home_screen.dart';
import 'package:projsoftware/screens/login_test.dart';
import 'package:projsoftware/values/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: ColorValues.grey),
        ),
        textTheme: TextTheme(
          body1: TextStyle(fontFamily: 'OpenSans'),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginTestScreen();
    // return HomeScreen();
  }
}
