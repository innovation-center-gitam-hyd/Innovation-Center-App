import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ic_inventory/myScreen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _userName, _pinNo, _email;
  var _data;
  Future<void> _getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _data = json.decode(ascii.decode(base64.decode(
        base64.normalize(prefs.getString('jwt').toString().split(".")[1]))));
    setState(() {
      _userName = _data['name'].toString();
      _pinNo = _data['pin'].toString();
      _email = _data['email'].toString();
    });
  }

  @override
  void initState() {
    _getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer())
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    color: Colors.black,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height / 10,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: MediaQuery.of(context).size.height / 7,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height / 10,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/en/a/a6/Gandhi_Institute_of_Technology_and_Management_logo.jpg"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            _data != null
                ? Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name :"),
                              Text("Pin Number :"),
                              //Text("Team :"),
                              Text("Email :"),
                              //Text("Phone Number :"),
                            ],
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_userName),
                              Text(_pinNo),
                              //Text("Code Crew"),
                              Text(_email),
                              //Text("124573698"),
                            ],
                          ),
                          Spacer(
                            flex: 4,
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                      ),
                    ),
                )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(child: Text("Settings",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),)),
              decoration: BoxDecoration(color: Colors.grey),
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString("jwt", null);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
