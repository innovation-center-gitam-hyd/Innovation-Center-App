import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  final String title;
  final Widget myBody;
  MyScaffold({@required this.title, @required this.myBody});
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
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 7.3),
            child: widget.myBody,
          ),
          Container(
            height: (MediaQuery.of(context).size.height / 7.3),
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

class MyListItemsScaffold extends StatefulWidget {
  final String title, items;
  final Widget myBody;
  MyListItemsScaffold(
      {@required this.title, @required this.items, @required this.myBody});
  @override
  _MyListItemsScaffoldState createState() => _MyListItemsScaffoldState();
}

class _MyListItemsScaffoldState extends State<MyListItemsScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: (MediaQuery.of(context).size.height / 7.3)+30),
            child: widget.myBody,
          ),
          Container(
            height: (MediaQuery.of(context).size.height / 7.3)+30,
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Spacer(
                  //   flex: 1,
                  // ),
                  // Text(
                  //   "${widget.items} Items found",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(
                  //     (MediaQuery.of(context).size.height / 200),
                  //   ),
                  // ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.items} Items found",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height / 7.3),
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
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "${widget.title}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  )
                ],
              ),
            ),
          ),
          //Text("data")
        ],
      ),
    );
  }
}
