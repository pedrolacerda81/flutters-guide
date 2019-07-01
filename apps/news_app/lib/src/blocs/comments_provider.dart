//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
import './comments_bloc.dart';
//Pages Exports
export './comments_bloc.dart';
//Class
class CommentsProvider extends InheritedWidget {
  //Bloc declaration
  final CommentsBloc bloc;
  //Constructor Method
  CommentsProvider({Key key, Widget child})
    : bloc = CommentsBloc(),
      super(key: key, child: child);
  //USN Method
  bool updateShouldNotify(_) => true;
  //Of Method
  static CommentsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CommentsProvider) as CommentsProvider).bloc;
  }
}
