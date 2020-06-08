import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  final String title;
  final Widget myBody;
  MyScaffold({@required this.title,@required this.myBody});
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 7.8),
            child: widget.myBody,
          ),
          Container(
            height: (MediaQuery.of(context).size.height / 7.8),
            decoration: BoxDecoration(
              color: Color(0xFF4EAEFF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      //size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
