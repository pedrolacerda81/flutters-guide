//Packages Imports
import 'package:flutter/material.dart';
import 'dart:async';
//Pages Imports
import '../widgets/loading_container.dart';
import '../models/item.dart';

//Widget
class Comment extends StatelessWidget {
  //Variables and Keys
  final int itemId;
  final Map<int, Future<Item>> itemMap;
  final int depth;
  //Constructor Method
  Comment({this.itemId, this.itemMap, this.depth});
  //Build Method
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (BuildContext context, AsyncSnapshot<Item> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }
        final item = snapshot.data;
        final children = <Widget>[
          ListTile(
            title: buildTitleText(item),
            subtitle: item.by == '' ? Text('Deleted') : Text(item.by),
            contentPadding: EdgeInsets.only(right: 16.0, left: depth * 16.0),
          ),
          Divider(),
        ];

        snapshot.data.kids.forEach((kidId) {
          children.add(
            Comment(
              itemId: kidId,
              itemMap: itemMap,
              depth: depth + 1,
            ),
          );
        });

        return Column(
          children: children,
        );
      },
    );
  }

  //Other Methods
  Widget buildTitleText(Item item) {
    final text = item.text
        .replaceAll('&#x27;', "'")
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '');
    return Text(text);
  }
  /**/
}
//Classes
