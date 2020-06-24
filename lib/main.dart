import 'package:flutter/material.dart';
import 'package:ic_inventory/myScreen/dashboard.dart';
import 'package:ic_inventory/myScreen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isJWT;
  Future<void> _getJWT() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      print(prefs.getString("jwt"));
      _isJWT = prefs.getString("jwt") == null || prefs.getString("jwt").toString().compareTo("")==0 || prefs.getString("jwt").toString().split(".").length !=3? false : true;
    });
  }

  @override
  void initState() {
    _getJWT();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_isJWT);
    return _isJWT==true?MyDashboard():(_isJWT==false?Login():Container(color: Colors.white,));
  }
}

