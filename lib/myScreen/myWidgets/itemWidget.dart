import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String item, uqId, itemCode, qty;
  ItemWidget(
      {@required this.item,
      @required this.uqId,
      @required this.itemCode,
      @required this.qty});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text("$item"),
        isThreeLine: true,
        subtitle: Text("$uqId \n$itemCode"),
        trailing: Text("$qty"),
      ),
    );
  }
}
