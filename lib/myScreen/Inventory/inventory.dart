import 'package:flutter/material.dart';
import 'package:ic_inventory/myScreen/Inventory/inventoryAdmin.dart';
import 'package:ic_inventory/myScreen/myWidgets/itemWidget.dart';
import 'package:ic_inventory/myScreen/myWidgets/myScaffold.dart';
import 'package:page_transition/page_transition.dart';

class MyInventory extends StatelessWidget {
  final bool isAdmin;
  MyInventory({@required this.isAdmin});
  @override
  Widget build(BuildContext context) {
    print(isAdmin);
    return MyScaffold(
      title: "Inventory",
      myBody: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.format_list_bulleted),
              title: Text(
                "Inventory List",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  child: MyInventoryList(),
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 150),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
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
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  child: MyInventoryItems(),
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 150),
                ),
              ),
            ),
          ),
          isAdmin
              ? Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 150),
                        child: AdminMode(),
                      ),
                    ),
                  ),
                  //color: Color(0xFFF5F5F5),
                )
              : Container(),
        ],
      ),
    );
  }
}

class MyInventoryList extends StatefulWidget {
  @override
  _MyInventoryListState createState() => _MyInventoryListState();
}

class _MyInventoryListState extends State<MyInventoryList> {
  @override
  Widget build(BuildContext context) {
    return MyListItemsScaffold(
      title: "Inventory List",
      items: "200",
      myBody: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 20,
              child: Text("Search Bar"),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 5),
              itemBuilder: (BuildContext conext, i) {
                return ItemWidget(
                  item: "Item Name",
                  itemCode: "0001-1-02",
                  qty: "67",
                  uqId: "ICINV5d986ee86fcf3",
                );
              },
              separatorBuilder: (BuildContext conext, i) => Divider(
                thickness: 1,
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class MyInventoryItems extends StatefulWidget {
  @override
  _MyInventoryItemsState createState() => _MyInventoryItemsState();
}

class _MyInventoryItemsState extends State<MyInventoryItems> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "My Items",
      myBody: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Text(
                    "Your Items",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              radius: MediaQuery.of(context).size.height / 100,
                            ),
                            Text("\tNot Returned")
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              radius: MediaQuery.of(context).size.height / 100,
                            ),
                            Text("\tReturned")
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orangeAccent,
                              radius: MediaQuery.of(context).size.height / 100,
                            ),
                            Text("\tConsumed")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.limeAccent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Item Name",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Qty.",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //upper portion items
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, i) {
                return DueItemWidget(
                  item: "Item Name",
                  itemCode: "0001-1-02",
                  qty: "67",
                  uqId: "ICINV5d986ee86fcf3",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
