import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projsoftware/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:projsoftware/features/auth/presentation/bloc/auth_state.dart';
import 'package:projsoftware/model/user_model.dart';
import 'package:projsoftware/screens/change_profile_screen.dart';
import 'package:projsoftware/screens/edit_profile_screen.dart';
import 'package:projsoftware/screens/filter_by_type_screen.dart';
import 'package:projsoftware/screens/available_environments_screen.dart';
import 'package:projsoftware/screens/lonely_wolf_profile_screen.dart';
import 'package:projsoftware/values/colors.dart';
import 'package:projsoftware/values/strings.dart';

import '../../features/auth/presentation/bloc/bloc.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _toFilter = false;

  Widget _buildHeader (BuildContext context, UserModel userModel, String image){
    return DrawerHeader(
              
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: FittedBox(
                        child: Image.asset(image,
                            width: 70, height: 70)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorValues.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(StringValues.GREETINGS + userModel.name),
                  SizedBox(
                    height: 8,
                  ),
                  Text(userModel.course),
                ],
              ),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  // color: ColorValues.lonelyWolf,
                  // color: ColorValues.jackOfAllTrades,
                  // color: ColorValues.outgoing,
                  ),
            );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          SafeArea(
            bottom: true,
            
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state){
                if (state is LoadedLonelyWolf){
                  return _buildHeader(context, state.userModel, "assets/images/icon_lobo.png");
                } else if (state is LoadedOutGoing){
                  return _buildHeader(context, state.userModel, "assets/images/icon_galera.png");
                } else if (state is LoadedJack){
                  return _buildHeader(context, state.userModel, "assets/images/icon_tempo.png");
                } else { 
                   return _buildHeader(context, UserModel("", "", "", ""),"assets/images/icon.png");
                }
              },
            )
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(StringValues.HOME_TILE),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LonelyWolf()),
                // MaterialPageRoute(builder: (context) => Outgoing())
              );
            },
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text(StringValues.AVAIBLE_ENVIRONMENTS),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AvailableEnvironment()),
              );
            },
          ),
          ExpansionTile(
              leading: Icon(Icons.search),
              title: Text(StringValues.FILTER_ENVIRONMENTS),
              children: <Widget>[
                GestureDetector(
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(72, 0, 0, 0),
                    title: Text(StringValues.FILTER_TYPE),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterByTypeScreen()),
                    );
                  },
                ),
                GestureDetector(
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(72, 0, 0, 0),
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
              BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadedSignOut) {
          Navigator.pushReplacementNamed(context, "/");
        } else if (state is Error) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return _buildDrawer(context);
        },
      ),
    );
  }
}
