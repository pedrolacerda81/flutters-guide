//Packages Imports
import 'package:flutter/material.dart';

//Pages Imports
import './screens/news_list.dart';
import './blocs/stories_provider.dart';

//Widget
class App extends StatelessWidget {
  //Variables and Keys
  //Build Method
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Hacker News',
        home: NewsList(),
      ),
    );
  }
  //Other Methods
  /**/
}
//Classes
