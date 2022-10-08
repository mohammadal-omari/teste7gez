
// import 'dart:html';

import 'package:e7gez_admin/screens/dashboard/dashboard_screen.dart';
import 'package:e7gez_admin/screens/login/login_page.dart';
import 'package:e7gez_admin/services/auth_service.dart';
import 'package:e7gez_admin/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  static const routeName = '/Loading';

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(child: Logo(),);
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    //final socketService = Provider.of<SocketService>(context, listen: false);

    final auth = await authService.logged();
    if (auth) {
      //socketService.connect("noroom");
      //Navigator.pushReplacementNamed(context, UsersPage.routeName);
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => DashboardScreen(),
              transitionDuration: const Duration(milliseconds: 0)));
    } else {
      //Navigator.pushReplacementNamed(context, LoginPage.routeName);
      
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => const LoginPage(),
              transitionDuration: const Duration(milliseconds: 0)));
    }
  }
}