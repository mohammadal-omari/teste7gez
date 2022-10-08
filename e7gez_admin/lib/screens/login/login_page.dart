

import 'package:e7gez_admin/helpers/show_alert.dart';
import 'package:e7gez_admin/screens/dashboard/dashboard_screen.dart';
import 'package:e7gez_admin/services/auth_service.dart';
import 'package:e7gez_admin/widgets/button_sign.dart';
import 'package:e7gez_admin/widgets/input.dart';
import 'package:e7gez_admin/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey[300],
        body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Logo(),
                const SizedBox(
                  height: 5,
                ),
                _Form(),
                const SizedBox(
                  height: 5,
                ),
                // const LoginRegisterButton(
                //   routeName: RegisterPage.routeName,
                //   label: "First Time Here?",
                //   textButton: 'Create an Account!',
                // ),
                const SizedBox(height: 15),
                const Text('Terms and Conditions'),
              ]),
        ),
      ),
    ));
  }
}

class _Form extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    //final socketService = Provider.of<SocketService>(context);
    return Center(
      child: Container(
        constraints: const BoxConstraints(minWidth: 180, maxWidth: 600),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(children: [
          Input(
            icon: Icons.email_outlined,
            placeholder: 'Email',
            maxLenght: 32,
            controller: emailController,
          ),
          const SizedBox(
            height: 16,
          ),
          Input(
            icon: Icons.lock_outlined,
            placeholder: 'Password',
            maxLenght: 32,
            controller: passController,
            hidden: true,
          ),
          const SizedBox(
            height: 16,
          ),
          SignButton(
            label: 'Log In',
            press: authService.loading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final loginOK = await authService.login(
                        emailController.text.trim(), passController.text);
                    if (loginOK) {
                      //conectar a socketserver
                      //socketService.connect("noroom");
                      //navegar a la pantalla de usuarios
                      
                      Navigator.pushReplacementNamed(
                          context, DashboardScreen.routeName);
                    } else {
                      showAlert(context, 'Login Incorrect',
                          'Check your credentials and try again');
                    }
                  },
          ),
        ]),
      ),
    );
  }
}