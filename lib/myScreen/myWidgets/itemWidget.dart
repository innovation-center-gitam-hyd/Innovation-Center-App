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
        onTap: () {},
        title: Text(
          "$item",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        isThreeLine: true,
        subtitle: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black87, fontSize: 14.5),
            children: [
              TextSpan(text: "$uqId", style: TextStyle(color: Colors.black)),
              TextSpan(text: "\n$itemCode")
            ],
          ),
        ),
        trailing: Text(
          "$qty",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
