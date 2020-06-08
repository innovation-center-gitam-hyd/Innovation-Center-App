import 'package:flutter/material.dart';
import 'package:ic_inventory/myScreen/Inventory/inventoryAdmin.dart';
import 'package:ic_inventory/myScreen/myWidgets/myScaffold.dart';
import 'package:page_transition/page_transition.dart';

class MyInventory extends StatelessWidget {
  final bool _isAdmin;
  MyInventory(this._isAdmin);
  @override
  Widget build(BuildContext context) {
    print(_isAdmin);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height / 7.8),
              ),
              Expanded(
                child: Column(
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

                    _isAdmin
                        ? Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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

                    // Padding(
                    //   padding: EdgeInsets.all(0),
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //           top: 8,
                    //         ),
                    //         child: Text(
                    //           "Your Items",
                    //           style: TextStyle(
                    //               fontSize: 20, fontWeight: FontWeight.w500),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             Container(
                    //               child: Row(
                    //                 children: [
                    //                   CircleAvatar(
                    //                     backgroundColor: Colors.redAccent,
                    //                     radius:
                    //                         MediaQuery.of(context).size.height /
                    //                             100,
                    //                   ),
                    //                   Text("\tNot Returned")
                    //                 ],
                    //               ),
                    //             ),
                    //             Container(
                    //               child: Row(
                    //                 children: [
                    //                   CircleAvatar(
                    //                     backgroundColor: Colors.greenAccent,
                    //                     radius:
                    //                         MediaQuery.of(context).size.height /
                    //                             100,
                    //                   ),
                    //                   Text("\tReturned")
                    //                 ],
                    //               ),
                    //             ),
                    //             Container(
                    //               child: Row(
                    //                 children: [
                    //                   CircleAvatar(
                    //                     backgroundColor: Colors.orangeAccent,
                    //                     radius:
                    //                         MediaQuery.of(context).size.height /
                    //                             100,
                    //                   ),
                    //                   Text("\tConsumed")
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8),
                    //   child: Expanded(
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         color: Colors.yellowAccent,
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.only(left: 10),
                    //             child: Text("Item Name"),
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(right: 10),
                    //             child: Text("Qty."),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: SingleChildScrollView(
                    //       child: Column(
                    //         children: [
                    //           //My Items
                    //           Container(
                    //             color: Colors.redAccent,
                    //             height: 20,
                    //           ),
                    //           Container(
                    //             color: Colors.greenAccent,
                    //             height: 20,
                    //           ),
                    //           Container(
                    //             color: Colors.orangeAccent,
                    //             height: 20,
                    //           ),
                    //           Container(
                    //             color: Colors.redAccent,
                    //             height: 20,
                    //           ),
                    //           Container(
                    //             color: Colors.greenAccent,
                    //             height: 20,
                    //           ),
                    //           Container(
                    //             color: Colors.orangeAccent,
                    //             height: 20,
                    //           ),
                    //           Container(
                    //             color: Colors.redAccent,
                    //             height: 20,
                    //           ),
                    //           Container(
                    //             color: Colors.greenAccent,
                    //             height: 20,
                    //           ),
                    //           Container(
                    //             color: Colors.orangeAccent,
                    //             height: 20,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
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
                    "Inventory",
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

class MyInventoryList extends StatefulWidget {
  @override
  _MyInventoryListState createState() => _MyInventoryListState();
}

class _MyInventoryListState extends State<MyInventoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(),
          Container(
            height: (MediaQuery.of(context).size.height / 5.8),
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
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "200 Items found",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          (MediaQuery.of(context).size.height / 200)))
                ],
              ),
            ),
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
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Inventory List",
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

class MyInventoryItems extends StatefulWidget {
  @override
  _MyInventoryItemsState createState() => _MyInventoryItemsState();
}

class _MyInventoryItemsState extends State<MyInventoryItems> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(title: "My Items", myBody: Container());
  }
}
