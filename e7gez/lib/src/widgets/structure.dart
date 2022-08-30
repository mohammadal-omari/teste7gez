import 'package:e7gez/src/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:flutter/src/material/colors.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.title ,required this.mainWidget}) : super(key: key);
  final String title;
  final dynamic mainWidget;
  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Center(child: Text('Done', style: TextStyle(fontSize: 18)))
        ],
        title: Center(
            child: Text(
          widget.title,
          textAlign: TextAlign.center,
        )),
        leading: const Icon(Icons.arrow_back),
      ),
      body: widget.mainWidget,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My reservations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Profile',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 48, 156, 52),
        // onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
