import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  final String _placeHolder;
  final IconData _icon;
  final bool _password;
  final TextInputType _keyboardType;

  TextFieldInput(this._placeHolder, this._icon, this._password, this._keyboardType);

  TextFieldInput.texto(String placeHolder, IconData icon)
      : this._placeHolder = placeHolder,
        this._icon = icon,
        this._password = false,
        this._keyboardType = TextInputType.text;
  TextFieldInput.senha(String placeHolder)
      : this._placeHolder = placeHolder,
        this._icon = Icons.lock_outline,
        this._password = true,
        this._keyboardType = TextInputType.text;
  TextFieldInput.email(String placeHolder)
      : this._placeHolder = placeHolder,
        this._icon = Icons.mail_outline,
        this._password = false,
  
        this._keyboardType = TextInputType.emailAddress;

  @override
  State<StatefulWidget> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget._password,
      decoration: InputDecoration(
        suffixIcon: Icon(widget._icon),
        labelText: widget._placeHolder,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 5.0),
        ),
      ),
    );
  }
}
