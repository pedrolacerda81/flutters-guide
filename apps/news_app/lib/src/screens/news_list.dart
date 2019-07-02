//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
import '../blocs/stories_provider.dart';
import '../widgets/news_list_tile.dart';
import '../widgets/refresh_news_list.dart';

//Widget
class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

//Widget State
class _NewsListState extends State<NewsList> {
  //Variables and Keys
  //Build Method
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
        backgroundColor: Colors.indigo,
      ),
      body: biuldList(bloc),
    );
  }

  //Other Methods
  Widget biuldList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      //remember to put the type of the bloc.'thing' on the asyncsnapshot
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Refresh(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              bloc.fetchItem(snapshot.data[index]);
              return NewsListTile(
                itemId: snapshot.data[index],
              );
            },
          ),
        );
      },
    );
  }
  /**/
}
//Classes
