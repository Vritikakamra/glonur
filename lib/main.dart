import 'package:flutter/material.dart';
//import 'package:glonur/pages/landing_page.dart';
import 'package:glonur/pages/appbar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Appbarpage(), 
        //HomePage(),
      ),
    );
  }
}
