import 'package:flutter/material.dart';
import 'package:jeevika_n/Screen/homepage.dart';
import 'package:jeevika_n/Screen/splashScreen.dart';
import 'Screen/loginScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeevika',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/start':(BuildContext context)=>SplashScreen(),
          '/login':(BuildContext context)=>LoginScreen(),
          '/home':(BuildContext context)=>HomePage(),
        }
    );
  }
}

