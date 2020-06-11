import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text("Title"),
        isThreeLine: true,
        subtitle: Text("Demo \ndemo"),
        trailing: Text("1"),
      ),
    );
  }
}