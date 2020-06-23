import 'package:flutter/material.dart';
import 'package:ic_inventory/myScreen/myWidgets/myScaffold.dart';

class MyProject extends StatefulWidget {
  @override
  _MyProjectState createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Create new Project",
      myBody: Container(),
    );
  }
}
