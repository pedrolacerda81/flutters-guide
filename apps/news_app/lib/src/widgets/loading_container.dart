//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
//Widget
class LoadingContainer extends StatelessWidget {
  //Variables and Keys
//Build Method
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: buildLoadContainer(24.0, 50.0, 300),
          subtitle: buildLoadContainer(18.0, 20.0, 200),
        ),
        Divider(height: 8.0)
      ],
    );
  }
  //Other Methods
  Container buildLoadContainer(double h, double w, int o) {
    return Container(
      color: Colors.grey[o],
      height: h,
      width: w,
      margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
    );
  }
  /**/
}
//Classes