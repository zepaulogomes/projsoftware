import 'package:flutter/material.dart';
import 'package:projsoftware/screens/change_profile_screen.dart';
import 'package:projsoftware/screens/edit_profile_screen.dart';
import 'package:projsoftware/screens/home_screen.dart';
import 'package:projsoftware/values/colors.dart';
import 'package:projsoftware/values/strings.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _toFilter = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          SafeArea(
            bottom: true,
            child: DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: FittedBox(
                        child: Image.asset('assets/images/icon_lobo.png',
                            width: 70)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorValues.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(StringValues.GREETINGS + "Bárbara"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("bramos@id.uff.brs"),
                ],
              ),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  // color: ColorValues.lonelyWolf,
                  // color: ColorValues.jackOfAllTrades,
                  // color: ColorValues.outgoing,
                  ),
            ),
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(StringValues.HOME_TILE),
            ),
            onTap: () {
              debugPrint("clickey");
            },
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text(StringValues.AVAIBLE_ENVIRONMENTS),
            ),
            onTap: () {
              debugPrint("chegay");
            },
          ),
          ExpansionTile(
              leading: Icon(Icons.search),
              title: Text(StringValues.FILTER_ENVIRONMENTS),
              children: <Widget>[
                GestureDetector(
                  child: ListTile(
                    title: Text(StringValues.FILTER_TYPE),
                  ),
                  onTap: () {
                    debugPrint("chegando");
                  },
                ),
                GestureDetector(
                  child: ListTile(
                    title: Text(StringValues.FILTER_NAME),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangeProfile()),
                    );
                  },
                ),
              ]),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text(StringValues.CHANGE_PROFILE),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangeProfile()),
              );
            },
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text(StringValues.EDIT_SETTINGS),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(StringValues.LOGOUT),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
