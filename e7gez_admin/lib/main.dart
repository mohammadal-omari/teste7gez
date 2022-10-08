import 'package:e7gez_admin/constants.dart';
import 'package:e7gez_admin/controllers/MenuController.dart';
import 'package:e7gez_admin/routes/routes.dart';
import 'package:e7gez_admin/screens/loading/loading_page.dart';
import 'package:e7gez_admin/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //await initialization(null);
  FlutterNativeSplash.remove();
  runApp(        
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
           ChangeNotifierProvider(
          create: (_) => AuthService(),
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
      title: 'E7gez Admin App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
         textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
             .apply(bodyColor: Colors.white),
        //textTheme:textColor,
        canvasColor: secondaryColor,
      ),
      initialRoute: LoadingPage.routeName,//'/Login',
      routes: routes
      // {
      //   '/dashbord': (context) => DashboardScreen(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/second': (context) => SecondScreen(),
      // }
    );
  } 
}

Future initialization(BuildContext? context) async {
  //  Load Resources
  await Future.delayed(Duration(seconds: 5));
}