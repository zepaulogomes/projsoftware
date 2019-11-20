import 'package:flutter/material.dart';
import 'package:projsoftware/values/colors.dart';
import 'package:projsoftware/values/strings.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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
                      child: Image.asset('assets/images/icon_lobo.png'),
                      fit: BoxFit.fitHeight,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorValues.grey,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(StringValues.GREETINGS + "Bárbara"),
                  SizedBox(
                    height: 4,
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
          ListTile(
            leading: Icon(Icons.home),
            title: Text(StringValues.HOME_TILE),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(StringValues.AVAIBLE_ENVIRONMENTS),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text(StringValues.FILTER_ENVIRONMENTS),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text(StringValues.CHANGE_PROFILE),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(StringValues.EDIT_SETTINGS),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(StringValues.LOGOUT),
          ),
        ],
      ),
    );
  }
}
