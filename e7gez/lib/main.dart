import 'package:e7gez/src/pages/chat/chat.dart';
import 'package:e7gez/store/reducer.dart';
import 'package:flutter/material.dart';
import 'package:e7gez/src/pages/app.dart';
import 'package:e7gez/src/pages/profile.dart';
import 'package:e7gez/src/pages/home.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

enum Types { Click, Increment, AddQuote }

final store = Store<AppState>(reducers,
    initialState: AppState(count: 22, clickCount: 0, quote: "Test"),
    middleware: [thunkMiddleware]);
// void main() => runApp(const UserProfile());
// void main() => runApp(const Homepage());
void main() => runApp(ChatWidget(store: store,));
