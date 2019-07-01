//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
//Widget
class NewsDetail extends StatelessWidget {
  //Variables and Keys
  final int itemId;
  //Constructor Method
  NewsDetail({this.itemId});
  //Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Detail'),
      ),
      body: Center(
      child: Text('hey there, im a news detail with the id: $itemId'),
    ),
    );
  }
  //Other Methods
  /**/
}
//Classes
