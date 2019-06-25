//Packages Imports
import 'package:flutter/material.dart';
//Pages Imports
import '../blocs/stories_provider.dart';

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
      ),
      body: Center(
        child: biuldList(bloc),
      ),
    );
  }

  //Other Methods
  Widget biuldList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Text('Still waiting on Ids');
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(snapshot.data[index]);
          },
        );
      },
    );
  }
  /**/
}
//Classes
