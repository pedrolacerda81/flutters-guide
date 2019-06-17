//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
import './login.dart';

//Class Provider
class Provider extends InheritedWidget {
  //Constructor
  Provider({Key key, Widget child}) : super(key: key, child: child);
  //Variables
  final loginBloc = LoginBloc();
  //Update Should Notify Method
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  //Other Methods
  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        .loginBloc;
  }
}
