import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ic_inventory/myScreen/myProfile.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDashboard extends StatefulWidget {
  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  bool isAdmin = false;
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
                                      child: Image.asset(
                                          'assets/images/IC_Logo.png'),
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
                                    child: Stack(
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          backgroundColor: Colors.grey,
                                          child: CircularProgressIndicator(
                                            backgroundColor: Colors.transparent,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: NetworkImage(
                                            "http://innovationcenter.gitam.edu/teamfiles/team1920/images/ICP905d42fab599927.jpeg",
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
                  ),
                  color: Color(0xFFF5F5F5),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text(
                      "My Items",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  color: Color(0xFFF5F5F5),
                ),
                isAdmin
                    ? Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: Icon(Icons.category),
                          title: Text(
                            "Inventory Admin",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        color: Color(0xFFF5F5F5),
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
