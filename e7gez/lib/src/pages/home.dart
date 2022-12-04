import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:flutter/src/material/colors.dart';
import 'package:e7gez/src/widgets/layout.dart';
import 'package:e7gez/src/widgets/imageContainer.dart';

class Homepage extends StatelessWidget {

  static const routeName = '/homepage';

  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Body(title: 'home page', mainWidget: ImgList()),
    );
  }
}

class ImgList extends StatelessWidget {
  const ImgList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
 Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
            child: Container(
                height: 180.0,
                width: 500.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/10/4/1/FN_chain-restaurant-entrees_Applebees_Bourbon-Street-Chicken-Shrimp_s6x4.jpg.rend.hgtvcom.616.411.suffix/1538685780055.jpeg"),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Stack(children: [
                   const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0.2),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("This page describes how to download the Dart SDK. The Dart SDK has the libraries and command-line tools that you need to develop Dart command-line, server, and non-Flutter web apps. ",
                            style:  TextStyle(
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
                ])))]);
  }
}
