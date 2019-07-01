//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
import '../blocs/stories_provider.dart';
//Widget
class Refresh extends StatelessWidget {
  //Variables and Keys
  final Widget child;
  //Constructor Method
  Refresh({this.child});
  //Build Method
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchTopIds();
      },
    );
  }
  //Other Methods
  /**/
}
//Classes