import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projsoftware/components/UI/drawer.dart';
import 'package:projsoftware/components/UI/text_field.dart';
import 'package:projsoftware/screens/quiz_screen.dart';
import 'package:projsoftware/values/strings.dart';

class FilterByTypeScreen extends StatefulWidget {
  @override
  _FilterByTypeScreenState createState() => _FilterByTypeScreenState();
}

class _FilterByTypeScreenState extends State<FilterByTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildFilterByTypeScreen(context);
  }

  Widget _buildFilterByTypeScreen(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                      child: Text(
                        StringValues.FILTER_BY_TYPE_TITTLE,
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
                TextFieldInput.texto(
                    StringValues.FILTER_BY_TYPE_PLACEHOLDER, null),
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
                      debugPrint("clickey");
                    },
                    child: Text(
                      StringValues.FILTER_BY_TYPE_BUTTON_TITTLE,
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
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: width,
                  height: height * 0.45,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(-22.8808, -43.1043), zoom: 12.0),
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
