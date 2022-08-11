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
            child: Stack(children: [
              Image.network(images[index].url),
              Column(
                children: [
                  Center(
                    child: Text(images[index].title,
                        style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 200, width: 200,),
                  Container(
                    color: Colors.orange,
                    width: 150,
                    height: 50,
                    child:
                        Column(children: [Icon(Icons.restaurant), Text('Reserve Now')]),
                  )
                ],
              )
            ]),
          );
        });
  }
}
