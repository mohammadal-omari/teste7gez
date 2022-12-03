import 'package:e7gez/main.dart';
import 'package:e7gez/src/pages/chat/usersList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:e7gez/src/widgets/layout.dart';
import 'package:redux/redux.dart';

import '../../../store/reducer.dart';

class ChatWidget extends StatelessWidget {

  final Store<AppState> store;

  ChatWidget({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return StoreProvider(store: store, child: MaterialApp(
      title: 'CHAT WITH E7GEZ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Body(title: 'CHAT WITH E7GEZ', mainWidget: Chat()),
    ));
    // return 
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
      floatingActionButton: StoreConnector<AppState, IncrementCounter>(
            converter: (store) => () => store.dispatch(Types.Increment),
            builder: (_, IncrementCallBack) {
              return  new FloatingActionButton(
                onPressed: IncrementCallBack,
                tooltip: "Increment",
                child: new Icon(Icons.add),);
            },
          ),
          
      //  Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: <Widget>[
      //     StoreConnector<AppState, int>(
      //       converter: (store) => store.state.count,
      //       builder: (_, count) {
      //         return  Text('$count');
      //       },
      //     ),
      //     FloatingActionButton(
      //       onPressed: () => {},
      //       heroTag: null,
      //       child: const Icon(
      //         Icons.photo,
      //         color: Colors.black87,
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 12,
      //     ),     
      //      FloatingActionButton(
      //       onPressed: () => {},
      //       heroTag: null,
      //       child: const Icon(
      //         Icons.edit,
      //         color: Colors.black87,
      //       ),
      //     )
      //   ],
      // ),
    ));
  }
}

typedef void IncrementCounter();
typedef void GenerateQuote();
