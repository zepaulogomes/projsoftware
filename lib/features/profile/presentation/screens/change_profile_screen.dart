import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projsoftware/components/UI/profile_card.dart';
import 'package:projsoftware/features/environment/presentation/screens/jack_of_all_trades_screen.dart';
import 'package:projsoftware/features/environment/presentation/screens/lonely_wolf_profile_screen.dart';
import 'package:projsoftware/features/environment/presentation/screens/outgoing_screen.dart';
import 'package:projsoftware/features/profile/presentation/bloc/bloc.dart';
import 'package:projsoftware/values/strings.dart';

class ChangeProfile extends StatefulWidget {
  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  @override
  Widget build(BuildContext context) {
    return _buildChangeProfileScreen(context);
  }

  Widget _buildChangeProfileScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is Error) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is SettedProfile) {
            if (state.profile == StringValues.OUTGOING) {
              Navigator.pushReplacementNamed(context, "/outgoing");
            } else if (state.profile == StringValues.JACK_OF_ALL_TRADES) {
              Navigator.pushReplacementNamed(context, "/jack");
            } else if (state.profile == StringValues.LONELY_WOLF) {
              Navigator.pushReplacementNamed(context, "/lonelyWolf");
            }
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (contex, state) {
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return _buildOptions(context);
            }
          },
        ),
      ),
    );
  }

  ListView _buildOptions(BuildContext context) {
    return ListView(
      children: <Widget>[
        GestureDetector(
          child: ProfileCard.loboSolitario(),
          onTap: () {
            BlocProvider.of<ProfileBloc>(context).add(
              SetProfileEvent(
                newProfile: StringValues.LONELY_WOLF,
              ),
            );
          },
        ),
        GestureDetector(
          child: ProfileCard.semTempoRuim(),
          onTap: () {
            BlocProvider.of<ProfileBloc>(context).add(
              SetProfileEvent(
                newProfile: StringValues.JACK_OF_ALL_TRADES,
              ),
            );
          },
        ),
        GestureDetector(
          child: ProfileCard.daGalera(),
          onTap: () {
            BlocProvider.of<ProfileBloc>(context).add(
              SetProfileEvent(
                newProfile: StringValues.OUTGOING,
              ),
            );
          },
        ),
      ],
    );
  }
}
