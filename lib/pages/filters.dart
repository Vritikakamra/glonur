import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  final bool nowOpen;
  Filters({this.nowOpen});
  @override
  _FiltersState createState() => _FiltersState(nowOpen: nowOpen);
}

class _FiltersState extends State<Filters> {
  bool nowOpen;
  _FiltersState({this.nowOpen});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop([this.nowOpen]);
            },
            child: Text("OK")),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
              title: Text("Now Open"),
              value: this.nowOpen,
              onChanged: (bool val) {
                this.setState(() {
                  this.nowOpen = val;
                });
              }),
        ],
      ),
    );
  }
}
