import 'package:e7gez_admin/screens/dashboard/dashboard_screen.dart';
import 'package:e7gez_admin/screens/loading/loading_page.dart';
import 'package:e7gez_admin/screens/login/login_page.dart';
import 'package:e7gez_admin/screens/second/second_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  LoginPage.routeName: (_) => const LoginPage(),
  DashboardScreen.routeName: (_) => DashboardScreen(),
  SecondScreen.routeName: (_) => SecondScreen(),
  LoadingPage.routeName: (_) => LoadingPage(),
  // RegisterPage.routeName: (_) => RegisterPage(),
  // 
  // NewroomPage.routeName: (_) => NewroomPage(),
  // ChatPage.routeName: (_) => ChatPage(),
};