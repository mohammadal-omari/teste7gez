import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {

  late List<ImageModel> images;

  ImageList(this.images);
   
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Image.network(images[index].url),
        );
      }
    );
  }

}