//Packages Imports
import 'package:flutter/material.dart';
import 'dart:async';
//Pages Imports
import '../blocs/comments_provider.dart';
import '../models/item.dart';

//Widget
class NewsDetail extends StatelessWidget {
  //Variables and Keys
  final int itemId;
  //Constructor Method
  NewsDetail({this.itemId});
  //Build Method
  @override
  Widget build(BuildContext context) {
    final commentsBloc = CommentsProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Detail'),
      ),
      body: buildDetailBody(commentsBloc),
    );
  }

  //Other Methods
  Widget buildDetailBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.itemWithComments,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<Item>>> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }

        final itemFuture = snapshot.data[itemId];

        return FutureBuilder(
          future: itemFuture,
          builder: (BuildContext context, AsyncSnapshot<Item> itemSnapshop) {
            if (!itemSnapshop.hasData) {
              return Text('Loading Two...');
            }
            return buildItemTitle(itemSnapshop.data);
          },
        );
      },
    );
  }

  Container buildItemTitle(Item item) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(16.0),
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
  /**/
}
//Classes
