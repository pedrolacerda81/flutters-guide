//Packages Imports
import 'package:flutter/material.dart';

//Pages Imports
import '../mixins/validation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  Color obscureColor = Colors.grey;
  Map<String, String> _loginCredentials = {'email': null, 'pass': null};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildEmailField(),
            _dividerH(5.0),
            _buildPassField(),
            _dividerH(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _buildSubmitButton(),
                _dividerW(10.0),
                _buildResetButton()
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _dividerH(double h) {
    return SizedBox(
      height: h,
    );
  }

  SizedBox _dividerW(double w) {
    return SizedBox(
      width: w,
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: validationEmail,
      onSaved: (String value) {
        _loginCredentials['email'] = value;
      },
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: 'you@exemple.com'),
    );
  }

  TextFormField _buildPassField() {
    return TextFormField(
      obscureText: obscureText,
      validator: validationPass,
      onSaved: (String value) {
        _loginCredentials['pass'] = value;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'At least 6 characters',
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: obscureColor,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
              obscureColor =
                  obscureText ? Colors.grey : Theme.of(context).primaryColor;
            });
          },
        ),
      ),
    );
  }

  void _onPressSubmitButton() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
    print(_loginCredentials.toString());
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

  void _onPressClearButton() {
    _formKey.currentState.reset();
  }

  RaisedButton _buildResetButton() {
    return RaisedButton(
      color: Colors.redAccent,
      child: Text(
        'CLEAR',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _onPressClearButton,
    );
  }
}
