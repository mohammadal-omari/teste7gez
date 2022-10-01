import 'package:e7gez_admin/constants.dart';
import 'package:e7gez_admin/controllers/MenuController.dart';
import 'package:e7gez_admin/screens/dashboard/dashboard_screen.dart';
import 'package:e7gez_admin/screens/second/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child:const MyApp()
    )
  );
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E7gez Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
         textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
             .apply(bodyColor: Colors.white),
        //textTheme:textColor,
        canvasColor: secondaryColor,
      ),
      initialRoute: '/dashbord',
      routes: {
        '/dashbord': (context) => DashboardScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
      }
    );
  } 
}
