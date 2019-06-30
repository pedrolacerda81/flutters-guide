//Packages Imports
import 'package:flutter/material.dart';
import 'dart:async';
//Pages Imports
import '../blocs/stories_provider.dart';
import './loading_container.dart';
import '../models/item.dart';

//Widget
class NewsListTile extends StatelessWidget {
  //Variables and Keys
  final int itemId;
  //Constructor Method
  NewsListTile({this.itemId});
  //Build Method
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<Item>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: LoadingContainer(),
          );
        }
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (BuildContext context, AsyncSnapshot<Item> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            }
            return buildListTile(itemSnapshot.data);
          },
        );
      },
    );
  }
  //Other Methods
  Column buildListTile(Item item) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(item.title),
          subtitle: Text('${item.score} votes'),
          trailing: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.comment),
            Text('${item.descendants}'),
            ],
          ),
        ),
        Divider(
          height: 8.0,
        )
      ],
      
    );
  }
  /**/
}
//Classes
