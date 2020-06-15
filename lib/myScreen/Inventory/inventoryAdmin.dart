import 'package:flutter/material.dart';
import 'package:ic_inventory/myScreen/myWidgets/myScaffold.dart';
import 'package:page_transition/page_transition.dart';

class AdminMode extends StatefulWidget {
  @override
  _AdminModeState createState() => _AdminModeState();
}

class _AdminModeState extends State<AdminMode> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Inventory Admin",
      myBody: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          Container(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 150),
                  child: LendInventory(),
                ),
              ),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                    ListTile(
                      title: Text(
                        "Lend \nInventory Item",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 150),
                  child: ReturnInventory(),
                ),
              ),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.rotate_90_degrees_ccw,
                      size: 30,
                    ),
                    ListTile(
                      title: Text(
                        "Return \nInventory Item",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 150),
                  child: AddInventory(),
                ),
              ),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.playlist_add,
                      size: 30,
                    ),
                    ListTile(
                      title: Text(
                        "Add Inventory",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 150),
                  child: UpdateInventory(),
                ),
              ),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.update,
                      size: 30,
                    ),
                    ListTile(
                      title: Text(
                        "Update Inventory",
                        textAlign: TextAlign.center,
                      ),
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

class LendInventory extends StatefulWidget {
  @override
  _LendInventoryState createState() => _LendInventoryState();
}

class _LendInventoryState extends State<LendInventory> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Lend Inventory",
      myBody: Container(),
    );
  }
}

class AddInventory extends StatefulWidget {
  @override
  _AddInventoryState createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Add Inventory",
      myBody: Container(),
    );
  }
}

class ReturnInventory extends StatefulWidget {
  @override
  _ReturnInventoryState createState() => _ReturnInventoryState();
}

class _ReturnInventoryState extends State<ReturnInventory> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Return Inventory",
      myBody: Container(),
    );
  }
}

class UpdateInventory extends StatefulWidget {
  @override
  _UpdateInventoryState createState() => _UpdateInventoryState();
}

class _UpdateInventoryState extends State<UpdateInventory> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Update Inventory",
      myBody: Container(),
    );
  }
}



