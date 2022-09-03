import 'package:e7gez/src/pages/chat/usersList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:e7gez/src/widgets/layout.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(
      title: 'CHAT WITH E7GEZ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Body(title: 'CHAT WITH E7GEZ', mainWidget: Chat()),
    );
  }
}

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Messages",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Color(0xFF000000)),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.grey,
              )),
        ],
      ),
      body:  UsersList(name: "Aya", count: 1),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => {},
            heroTag: null,
            child: const Icon(
              Icons.photo,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 12,
          ),     
           FloatingActionButton(
            onPressed: () => {},
            heroTag: null,
            child: const Icon(
              Icons.edit,
              color: Colors.black87,
            ),
          )
        ],
      ),
    ));
  }
}
