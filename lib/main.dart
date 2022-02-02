import 'package:flutter/material.dart';
import 'Home.dart';
import 'SplashScreen.dart';
import 'TaskPage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/Home": (context) => Home(),
        "/TaskPage": (context) => TaskPage(),
      },
      home: SplashScreen(),
    );
  }
}