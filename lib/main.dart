import 'package:flutter/material.dart';
import 'package:jober/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jober',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.white30,
      ),
      home: HomeScreen(),
    );
  }
}
