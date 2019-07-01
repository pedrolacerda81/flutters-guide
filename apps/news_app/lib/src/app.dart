//Packages Imports
import 'package:flutter/material.dart';

//Pages Imports
import './screens/news_list.dart';
import './blocs/stories_provider.dart';
import './screens/news_detail.dart';

//Widget
class App extends StatelessWidget {
  //Variables and Keys
  //Build Method
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Hacker News',
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
  //Other Methods
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if(settings.name == '/') {
      return MaterialPageRoute(
      builder: (BuildContext context) {
          return NewsList();
        },
      );
    } else { // use switch if you've many more routes
      return MaterialPageRoute(
        builder: (BuildContext context) {
          final itemId = int.parse(settings.name.replaceAll('/', ''));
          return NewsDetail(
            itemId: itemId,
          );
        }
      );
    }
  }
  /**/
}
//Classes
