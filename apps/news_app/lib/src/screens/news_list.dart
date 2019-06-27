//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
import '../blocs/stories_provider.dart';
import '../widgets/news_list_tile.dart';

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
    //temporary!!!!!!
    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
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
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            bloc.fetchItem(snapshot.data[index]);
            return NewsListTile(
              itemId: snapshot.data[index],
            );
          },
        );
      },
    );
  }
  /**/
}
//Classes
