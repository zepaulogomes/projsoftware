import 'package:flutter/material.dart';
import 'package:projsoftware/values/colors.dart';
import 'package:projsoftware/values/strings.dart';

class ProfileCard extends StatelessWidget {
  final String _title, _description, _imgPath;
  final Color _headerColor;

  ProfileCard.loboSolitario()
      : this._title = StringValues.LONELY_WOLF,
        this._description = StringValues.LONELY_WOLF_DESCRIPTION,
        this._imgPath = 'assets/images/icon_lobo.png',
        this._headerColor = ColorValues.lonelyWolf;
  ProfileCard.semTempoRuim()
      : this._title = StringValues.JACK_OF_ALL_TRADES,
        this._description = StringValues.JACK_OF_ALL_TRADES_DESCRIPTION,
        this._imgPath = 'assets/images/icon_tempo.png',
        this._headerColor = ColorValues.jackOfAllTrades;
  ProfileCard.daGalera()
      : this._title = StringValues.OUTGOING,
        this._description = StringValues.OUTGOING_DESCRIPTION,
        this._imgPath = 'assets/images/icon_galera.png',
        this._headerColor = ColorValues.outgoing;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildCard(context),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.3,
      padding: EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
        color: this._headerColor,
      ),
      child: Container(
        padding: EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 12,
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    this._title,
                    style: TextStyle(
                      color: ColorValues.demiBlac,
                      fontFamily: 'Rubik',
                      fontSize: 36,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    this._description,
                    style: TextStyle(color: ColorValues.grey, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Flexible(
              flex: 1,
              child: Image.asset(this._imgPath),
            )
          ],
        ),
      ),
    );
  }
}
