import'package:flutter/material.dart';
import 'package:on_the_go_resume_app/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: HomeScreen()
      )
    );
  }
}