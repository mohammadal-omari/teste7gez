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
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 190, 49, 49)),
            ),
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Stack(children: [
              Image.network(images[index].url,
                  color: const Color.fromRGBO(255, 255, 255, 0.5),
                  colorBlendMode: BlendMode.modulate),
              Column(
                children: [
                  Center(
                    child: Text(images[index].title,
                        style: const TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(
                    height: 200,
                    width: 200,
                  ),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.only(left: 250),
                    child: Column(children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                              maximumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
                        ),
                        // ignore: avoid_print
                        onPressed: () { print(images[index].id); },
                        child: Column(
                          children: const [
                             Icon(Icons.restaurant_menu_outlined),
                            Text('Reserve Now',textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              )
            ]),
          );
        });
  }
}
