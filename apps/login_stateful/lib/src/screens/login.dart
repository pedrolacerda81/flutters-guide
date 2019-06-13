//Packages Imports
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildEmailField(),
            _divider(5.0),
            _buildPassField(),
            _divider(20.0),
            _buildSubmitButton()
          ],
        ),
      ),
    );
  }

  SizedBox _divider(double h) {
    return SizedBox(
      height: h,
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: 'you@exemple.com'),
    );
  }

  TextFormField _buildPassField() {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(Icons.remove_red_eye),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
    );
  }

  void _onPressSubmitButton() {
    print('hello submit button');
  }

  RaisedButton _buildSubmitButton() {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text(
        'LOGIN',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _onPressSubmitButton,
    );
  }
}
