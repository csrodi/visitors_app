import 'package:flutter/material.dart';
import 'package:visitors_app/pages/home.dart';
import 'package:visitors_app/pages/login.dart';
import 'package:visitors_app/pages/sign_in.dart';
import 'package:visitors_app/pages/sign_out.dart';

void main() => runApp(VisitorsApp());

class VisitorsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VisitorsApp',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: HomePage(),
      routes: {
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/': (context) => LoginPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/signin': (context) => SignInPage(),
        '/signout': (context) => SignOutPage(),
      },
    );
  }
}
