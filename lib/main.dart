import 'package:flutter/material.dart';
import 'package:glonur/pages/hospitals.dart';
import 'package:glonur/pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Glonur"),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
          ],
        ),
        drawer: Settings(),
        body: HospitalList(),
      ),
    );
  }
}
