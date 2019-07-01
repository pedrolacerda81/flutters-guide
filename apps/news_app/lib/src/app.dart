//Packages Imports
import 'package:flutter/material.dart';

//Pages Imports
import './blocs/comments_provider.dart';
import './blocs/stories_provider.dart';
import './screens/news_detail.dart';
import './screens/news_list.dart';

//Widget
class App extends StatelessWidget {
  //Variables and Keys
  //Build Method
  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
      child: MaterialApp(
        title: 'Hacker News',
        onGenerateRoute: onGenerateRoute,
     ),
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
          final commentsBloc = CommentsProvider.of(context);
          final itemId = int.parse(settings.name.replaceAll('/', ''));

          commentsBloc.fetchItemWithComments(itemId);

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
