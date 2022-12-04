import 'dart:math' as math show Random;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import 'inbox.dart';

class UsersList extends StatelessWidget {
  late String name;
  late int count;

  UsersList({required this.name, required this.count, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ChatList(
        title: name,
      ),
    );
  }
}

class ChatList extends StatefulWidget {
  ChatList({Key? Key, required this.title}) : super(key: Key);

  late String title;

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  int count = 0;
  List<User> users = [];
  late User user;

  // https://jsonplaceholder.typicode.com/users

  Future<List<User>> _getUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var data = await http.get(url);
    var dataList = json.decode(data.body);

    for (var element in dataList) {
      //print(element);
      users.add(User.fromJson(element));
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    Color getRandomColor() =>
        Colors.primaries[math.Random().nextInt(Colors.primaries.length)];

    return Container(
      child: FutureBuilder(
        future: _getUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (!snapshot.hasData) {
            return isNoData();
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  splashColor: getRandomColor(),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Inbox()));
                  },
                  child: Ink(
                      child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: getRandomColor(),
                      child: Text(snapshot.data![index].name
                          .substring(0, 2)
                          .toUpperCase()),
                    ),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(
                      '${snapshot.data![index].name} is on E7GEZ',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Feb ${index + 1}"),
                      ],
                    ),
                  )),
                );
              },
            );
          }
        },
      ),
    );
  }

  Container isNoData() {
    return Container(
      child: const Center(child: Text("Loading.....")),
    );
  }
}
