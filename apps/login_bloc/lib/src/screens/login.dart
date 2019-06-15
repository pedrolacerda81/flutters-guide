//Packages Imports
import 'package:flutter/material.dart';

//Pages Imports
//Widget
class Login extends StatelessWidget {
  //Variables and Keys
  /* bool obscureText = true;
  Color obscureColor = Colors.grey; */
  //Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(letterSpacing: 0.5),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            emailField(),
            passField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(context),
          ],
        ),
      ),
    );
  }

  //Other Methods
  TextField emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'Email Adress',
      ),
    );
  }

  TextField passField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'At least 6 characters.',
        labelText: 'Password',
        suffix: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
          ),
          onPressed: () {
            /* obscureText = !obscureText;
            obscureColor =
                obscureText ? Colors.grey : Theme.of(context).accentColor; */
          },
          color: Colors.grey,
        ),
      ),
    );
  }

  RaisedButton submitButton(BuildContext context) {
    return RaisedButton(
      child: Text('LOGIN', style: TextStyle(color: Colors.white)),
      onPressed: () {},
      color: Theme.of(context).primaryColor,
    );
  }
/***/
}
//Classes
