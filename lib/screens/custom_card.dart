import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.curso, this.nome});

  final curso;
  final nome;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: <Widget>[
                Text(curso),
              ],
            )));
  }
}