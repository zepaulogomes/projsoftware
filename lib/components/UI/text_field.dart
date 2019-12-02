import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  final String _placeHolder;
  final IconData _icon;
  final bool _password;
  final TextInputType _keyboardType;
  final Function _onChanged;

  TextFieldInput(
      this._placeHolder, this._icon, this._password, this._keyboardType, this._onChanged);

  TextFieldInput.texto(String placeHolder, IconData icon, Function onChanged)
      : this._placeHolder = placeHolder,
        this._icon = icon,
        this._password = false,
        this._keyboardType = TextInputType.text,
        this._onChanged = onChanged;
  TextFieldInput.senha(String placeHolder, Function onChanged)
      : this._placeHolder = placeHolder,
        this._icon = Icons.lock_outline,
        this._password = true,
        this._keyboardType = TextInputType.text,
        this._onChanged = onChanged;
  TextFieldInput.email(String placeHolder, Function onChanged)
      : this._placeHolder = placeHolder,
        this._icon = Icons.mail_outline,
        this._password = false,
        this._keyboardType = TextInputType.emailAddress,
        this._onChanged = onChanged;

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
      onChanged: widget._onChanged,
    );
  }
}
