//Packages Imports
import 'package:flutter/material.dart';

//Pages Imports
import '../blocs/login.dart';
import '../blocs/provider.dart';

//Widget
class Login extends StatelessWidget {
  //Variables and Keys
  //  bool obscureText = true;
  //  Color obscureColor = Colors.grey;
  //Build Method
  @override
  Widget build(BuildContext context) {
    //Build Method's variables
    final loginBloc = Provider.of(context);
    /**/
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
            emailField(loginBloc),
            passField(loginBloc),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(loginBloc),
          ],
        ),
      ),
    );
  }

  //Other Methods
  StreamBuilder emailField(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.email,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return TextField(
          onChanged: loginBloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Adress',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  StreamBuilder passField(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.password,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return TextField(
          onChanged: loginBloc.changePass,
          obscureText: true,
          decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: 'At least 6 characters.',
            labelText: 'Password',
            suffix: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
              ),
              onPressed: () {
                // obscureText = !obscureText;
                // obscureColor =
                //    obscureText ? Colors.grey : Theme.of(context).accentColor;
              },
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }

  StreamBuilder submitButton(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text('LOGIN', style: TextStyle(color: Colors.white)),
          onPressed: snapshot.hasData ? loginBloc.loginSubmit : null,
        );
      },
    );
  }
/***/
}
//Classes
