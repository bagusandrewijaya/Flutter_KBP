import 'package:flutter/material.dart';

class SettingPages extends StatefulWidget {
  const SettingPages({Key? key}) : super(key: key);

  @override
  State<SettingPages> createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Image.asset(
            "images/assets/waiting-nobg.gif",
            height: 150.0,
            width: 160.0,
          ),
          Center(
              child: Text(
            "Coming Soon Medical Checkup Page",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    ));
  }
}
