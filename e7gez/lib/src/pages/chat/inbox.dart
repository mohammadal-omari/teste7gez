import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Inbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1EA955),
          leading: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: const Icon(Icons.arrow_back)),
          title: Row(
            children: const [
               CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "MM",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10),
              child: Text("Mostafa", style: TextStyle(fontSize: 15)))
            ]
          ),
            actions:  <Widget>[
              Padding(padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert, size: 30.0),
                
              ),)

            ]
        ),
      ),
    );
  }
}
