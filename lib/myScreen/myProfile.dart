import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Innovation Center",style: TextStyle(fontFamily: 'TimesNewRoman'),),
        backgroundColor: Colors.black,
        actions: <Widget>[IconButton(icon: Icon(Icons.settings), onPressed: (){})],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=>Navigator.pop(context),
        ),
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
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 10,
                    backgroundImage: NetworkImage(
                        "http://innovationcenter.gitam.edu/teamfiles/team1920/images/ICP905d42fab599927.jpeg"),
                    backgroundColor: Colors.white10,
                  ),
                ),
              ],
            ),
            Text("Name"),
            
          ],
        ),
      ),
    );
  }
}
