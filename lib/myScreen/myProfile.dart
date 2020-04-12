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
                            "http://innovationcenter.gitam.edu/teamfiles/team1920/images/ICP905d42fab599927.jpeg"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(text: 'Name : '),
                                  TextSpan(text: 'Rajeep Ray')
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(text: 'Email : '),
                                  TextSpan(text: 'demomail@gmail.com')
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(text: 'Phone Number : '),
                                  TextSpan(text: '1234567895')
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(text: 'Pin Number : '),
                                  TextSpan(text: '221910304039')
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 3,
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString("jwt", null);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
