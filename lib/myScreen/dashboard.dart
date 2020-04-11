import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ic_inventory/myScreen/myProfile.dart';

class MyDashboard extends StatefulWidget {
  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: (MediaQuery.of(context).size.height / 4.5),
                    color: Colors.black,
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
                                    onTap: () => print("Innovation Center"),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      child: Image(
                                        height: (MediaQuery.of(context)
                                                .size
                                                .height /
                                            8),
                                        image: NetworkImage(
                                            "https://innovationcenter.gitam.edu/images/Logo.png"),
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
                                      fontSize: 25,
                                      fontFamily: 'TimesNewRoman',
                                    ),
                                  ),
                                  Text(
                                    "Center",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
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
                                        MaterialPageRoute(
                                          builder: (context) => MyProfile(),
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.height /
                                                30,
                                        backgroundColor: Colors.grey,
                                        backgroundImage: NetworkImage(
                                          "http://innovationcenter.gitam.edu/teamfiles/team1920/images/ICP905d42fab599927.jpeg",
                                        ),
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
            Card(),
          ],
        ),
      ),
    );
  }
}
