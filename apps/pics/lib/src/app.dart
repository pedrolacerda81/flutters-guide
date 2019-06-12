// App Widget

//Import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import './models/image.dart';
import './widgets/image_list.dart';

// Create a class that will be our custom widget
// This class must exted the 'StatelessWidget' base class

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

// Must define a 'build' method that returns
// the widgets that *this* widget will show
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Lets see some images!'),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
    ));
  }
}
