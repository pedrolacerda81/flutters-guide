//Packages Imports
import 'package:flutter/material.dart';
import 'package:login_stateful/src/screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Stateful',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Stateful'),
        ),
        body: Center(
          child: Login(),
        ),
      ),
    );
  }
}
