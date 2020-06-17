import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
        onTap: () => showDialog(
          context: context,
          builder: (context) => QrDialog(
            uqId: uqId,
          ),
        ),
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

class DueItemWidget extends StatelessWidget {
  final String item, uqId, itemCode, qty;
  final int status;
  DueItemWidget(
      {@required this.item,
      @required this.uqId,
      @required this.itemCode,
      @required this.qty,
      @required this.status});
  @override
  Widget build(BuildContext context) {
    print(status);
    return Container(
      //color: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onTap: () => showDialog(
          context: context,
          builder: (context) => QrDialog(
            uqId: uqId,
          ),
        ),
        title: Text(
          "$item",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        isThreeLine: false,
        subtitle: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black87, fontSize: 14.5),
            children: [
              TextSpan(text: "$uqId", style: TextStyle(color: Colors.black)),
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

class QrDialog extends StatelessWidget {
  final String uqId;
  QrDialog({@required this.uqId});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                "Scan QR-Code",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            QrImage(
              data: '$uqId',
              size: 200,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
