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
        //backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          _MyInventoryCard(),
          _MyInventoryCard(),
        ],
      ),
    );
  }
}

class _MyInventoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ListTile(
          title: Text(
            "Item Name",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text("Unique Id\nCode Id"),
          isThreeLine: true,
          /*trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1",style: TextStyle(fontSize: 18),),
            ],
          ),*/
          trailing: Text(
            "1",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
