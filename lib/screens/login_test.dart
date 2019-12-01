import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:projsoftware/components/UI/drawer.dart';

import 'custom_card.dart';

class LoginTestScreen extends StatefulWidget {
  @override
  _LoginTestScreenState createState() => _LoginTestScreenState();
}

class _LoginTestScreenState extends State<LoginTestScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildLoginTestScreen(context);
  }

  Widget _buildLoginTestScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      drawer: new AppDrawer(),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('USUARIOS').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    return new ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return new CustomCard(
                            curso: document['curso'],
                            nome: document['nome'],
                          );
                      }).toList(),
                    );
                }
              },
            )),
      ),
    );
  }
}
