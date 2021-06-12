import 'package:flutter/material.dart';
import 'package:glonur/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  final regurl = "https://dev.glonur.com/registration";

  final logurl = "https://dev.glonur.com/login";
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Button(
            text: "LOGIN",
            onPressed: () async {
              await canLaunch(logurl)
                  ? await launch(logurl)
                  : throw 'Could not launch $logurl';
            },
          ),
          Button(
            text: "REGISTER",
            onPressed: () async {
              await canLaunch(regurl)
                  ? await launch(regurl)
                  : throw 'Could not launch $regurl';
            },
          ),
        ],
      ),
    ));
  }
}
