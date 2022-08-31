import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:flutter/src/material/colors.dart';

  @immutable
class ImgContainer extends StatefulWidget {
   ImgContainer({Key? key, required this.url, required this.desc})
      : super(key: key);
  final String url;
  final String desc;

  @override
  State<ImgContainer> createState() => _ImgContainer();
}

class _ImgContainer extends State<ImgContainer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(
        home: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
            child: Container(
                height: 180.0,
                width: 500.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.url),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Stack(children: [
                   Padding(
                      padding:
                         const EdgeInsets.symmetric(horizontal: 15, vertical: 0.2),
                      child: Padding(
                          padding:const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            widget.desc ,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                backgroundColor:
                                    Color.fromARGB(103, 33, 31, 26)),
                          ))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(80, 125, 0, 0),
                      child: ElevatedButton(
                          onPressed: () => {}, child: const Text("Press Me"))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(180, 125, 0, 0),
                      child: ElevatedButton(
                          onPressed: () => {}, child: const Text("click Me"))),
                ]))));
  }
}
