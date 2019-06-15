//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
import './screens/login.dart';

//Widget
class App extends StatelessWidget {
  //Variables and Keys
  //Build Method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log Me In',
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        accentColor: Colors.amber[800],
      ),
      home: Login(),
    );
  }
  //Other Methods
}
//Classes
