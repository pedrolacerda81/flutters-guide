//Packages Imports
import 'package:flutter/material.dart';

//Pages Imports
import './screens/home.dart';

//Widget
class App extends StatelessWidget {
  //Variables and Keys
  //Build Method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Animation',
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
      home: Home(),
    );
  }
  //Other Methods
  /**/
}
//Classes
