import 'package:flutter/material.dart';

class MyInventory extends StatefulWidget {
  @override
  _MyInventoryState createState() => _MyInventoryState();
}

class _MyInventoryState extends State<MyInventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Innovation Center",
          style: TextStyle(fontFamily: 'TimesNewRoman', fontSize: 25),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Inventory List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
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
