//Imports
import 'package:flutter/material.dart';
import '../models/image.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildImageItem(images[index]);
      },
    );
  }

  Container _buildImageItem(ImageModel image) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
      ),
      child: Column(
        children: <Widget>[
          Image.network(image.url),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              image.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700], fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
