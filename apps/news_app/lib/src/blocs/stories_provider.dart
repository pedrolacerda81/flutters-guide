//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
import './stories_bloc.dart';
//Exports
export './stories_bloc.dart';

//Provider Class
class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({Key key, Widget child})
      : bloc = StoriesBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static StoriesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StoriesProvider)
            as StoriesProvider)
        .bloc;
  }
}
