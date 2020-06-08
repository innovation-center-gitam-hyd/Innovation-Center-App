import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ic_inventory/myScreen/Inventory/inventory.dart';
import 'package:ic_inventory/myScreen/myProfile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDashboard extends StatefulWidget {
  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  bool _isAdmin = false;

  Future<void> _checkAdmin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _mem, _data;
    setState(() {
      _data = prefs.getString('jwt').toString().split(".");
      print(json.decode(
          ascii.decode(base64.decode(base64.normalize(_data[1]))))['member']);
      _mem = int.parse(json.decode(
          ascii.decode(base64.decode(base64.normalize(_data[1]))))['member']);
      _isAdmin = _mem == 2 ? true : false;
    });
  }

  @override
  void initState() {
    _checkAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: (MediaQuery.of(context).size.height / 4.5),
                  color: Color(0xFF4EAEFF),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Spacer(
                                  flex: 1,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    const url =
                                        'https://innovationcenter.gitam.edu/';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      child: Image.asset('images/IC_Logo.png'),
                                    ),
                                  ),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "Innovation",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'TimesNewRoman',
                                  ),
                                ),
                                Text(
                                  "Center",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'TimesNewRoman',
                                  ),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.height / 10),
                                width:
                                    (MediaQuery.of(context).size.height / 10),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      PageTransition(
                                        child: MyProfile(),
                                        type: PageTransitionType.fade,
                                        //alignment: Alignment.topRight,
                                      ),
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          backgroundColor: Colors.white,
                                          child: CircularProgressIndicator(
                                            backgroundColor: Colors.transparent,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.grey),
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: NetworkImage(
                                            "https://upload.wikimedia.org/wikipedia/en/a/a6/Gandhi_Institute_of_Technology_and_Management_logo.jpg",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 5,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Icon(Icons.format_list_bulleted),
                    title: Text(
                      "New Project",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 150),
                        child: MyInventory(_isAdmin),
                      ),
                    ),
                  ),
                  //color: Color(0xFFF5F5F5),
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Icon(Icons.format_list_bulleted),
                    title: Text(
                      "Inventory",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 150),
                        child: MyInventory(_isAdmin),
                      ),
                    ),
                  ),
                  //color: Color(0xFFF5F5F5),
                ),
                // Card(
                //   elevation: 5,
                //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //   child: ListTile(
                //     leading: Icon(Icons.assignment),
                //     title: Text(
                //       "My Items",
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //     trailing: Icon(Icons.arrow_forward_ios),
                //     onTap: () => Navigator.push(
                //       context,
                //       PageTransition(
                //         type: PageTransitionType.rightToLeft,
                //         duration: Duration(milliseconds: 150),
                //         child: MyItems(),
                //       ),
                //     ),
                //   ),
                //   //color: Color(0xFFF5F5F5),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
