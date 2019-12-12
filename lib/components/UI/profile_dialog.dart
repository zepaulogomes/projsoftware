import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projsoftware/values/colors.dart';
import 'package:projsoftware/values/strings.dart';

import '../../features/profile/presentation/bloc/bloc.dart';
import '../../features/profile/presentation/bloc/profile_event.dart';

class CustomDialog extends StatelessWidget {
  String _title, _description, _imgPath, _profile;
  Color _headerColor;

  CustomDialog.loboSolitario()
      : this._profile = StringValues.LONELY_WOLF,
        this._title = StringValues.LONELY_WOLF_TITLE,
        this._description = StringValues.LONELY_WOLF_DESCRIPTION,
        this._imgPath = 'assets/images/icon_lobo.png',
        this._headerColor = ColorValues.lonelyWolf;
  CustomDialog.semTempoRuim()
      : this._profile = StringValues.JACK_OF_ALL_TRADES,
        this._title = StringValues.JACK_OF_ALL_TRADES_TITILE,
        this._description = StringValues.JACK_OF_ALL_TRADES_DESCRIPTION,
        this._imgPath = 'assets/images/icon_tempo.png',
        this._headerColor = ColorValues.jackOfAllTrades;
  CustomDialog.daGalera()
      : this._profile = StringValues.OUTGOING,
        this._title = StringValues.OUTGOING_TITLE,
        this._description = StringValues.OUTGOING_DESCRIPTION,
        this._imgPath = 'assets/images/icon_galera.png',
        this._headerColor = ColorValues.outgoing;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Stack(
        children: <Widget>[
          _buildCard(context),
          _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.only(
        top: 30,
      ),
      decoration: BoxDecoration(
        color: this._headerColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              this._title,
              style: TextStyle(
                color: ColorValues.demiBlac,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              this._description,
              style: TextStyle(color: ColorValues.grey, fontSize: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Uhm, acho que não",
                    style: TextStyle(color: ColorValues.black, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(context, "/change");

                  },
                ),
                FlatButton(
                  child: Text(
                    "Na mosca!",
                    style: TextStyle(color: ColorValues.black, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    BlocProvider.of<ProfileBloc>(context).add(
                      SetProfileEvent(
                        newProfile: this._profile,
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Positioned(
      left: 15,
      right: 15,
      child: Container(
        height: 104,
        width: 104,
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            new BoxShadow(
              color: Colors.black,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: Image.asset(this._imgPath),
        ),
      ),
    );
  }
}
