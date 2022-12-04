import 'package:e7gez/main.dart';
import 'package:e7gez/src/pages/chat/chat.dart';
import 'package:e7gez/src/pages/home.dart';
import 'package:e7gez/src/pages/profile.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  ChatWidget.routeName: (_) => ChatWidget(
        store: store,
      ),
  Homepage.routeName: (_) => const Homepage(),
  UserProfile.routeName: (_) => const UserProfile(),
  // LoadingPage.routeName: (_) => LoadingPage(),
  // RegisterPage.routeName: (_) => RegisterPage(),
  //
  // NewroomPage.routeName: (_) => NewroomPage(),
  // ChatPage.routeName: (_) => ChatPage(),
};
