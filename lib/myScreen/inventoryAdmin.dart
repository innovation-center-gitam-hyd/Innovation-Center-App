import 'package:flutter/material.dart';

class AdminMode extends StatefulWidget {
  @override
  _AdminModeState createState() => _AdminModeState();
}

class _AdminModeState extends State<AdminMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        centerTitle: true,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          Container(
            child: GestureDetector(
              onTap: () => print("Lend Inventory Item"),
              child: Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                    ListTile(
                      title: Text("Lend Inventory Item"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () => print("Return Inventory Item"),
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.rotate_90_degrees_ccw,
                      size: 30,
                    ),
                    ListTile(
                      title: Text("Return Inventory Item"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () => print("Add Inventory"),
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.playlist_add,
                      size: 30,
                    ),
                    ListTile(
                      title: Text("Add Inventory"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () => print("Update Inventory"),
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.update,
                      size: 30,
                    ),
                    ListTile(
                      title: Text("Update Inventory"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
