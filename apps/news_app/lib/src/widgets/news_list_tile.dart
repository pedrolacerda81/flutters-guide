//Packages Imports
import 'package:flutter/material.dart';
import 'dart:async';
//Pages Imports
import '../blocs/stories_provider.dart';
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
            child: CircularProgressIndicator(),
          );
        }
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (BuildContext context, AsyncSnapshot<Item> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text('Still loading the item $itemId');
            }
            return Text(itemSnapshot.data.title);
          },
        );
      },
    );
  }
  //Other Methods
  /**/
}
//Classes
