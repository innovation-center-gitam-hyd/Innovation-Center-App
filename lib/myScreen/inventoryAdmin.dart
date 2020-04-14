import 'package:flutter/material.dart';

class AdminMode extends StatefulWidget {
  @override
  _AdminModeState createState() => _AdminModeState();
}

class _AdminModeState extends State<AdminMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Innovation Center",
          style: TextStyle(fontFamily: 'TimesNewRoman', fontSize: 25),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}