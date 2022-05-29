import 'package:flutter/material.dart';

class Dating_dates extends StatefulWidget {
  static const String routeName = "/dating_dates";
  @override
  State<Dating_dates> createState() => _Dating_datesState();
}

class _Dating_datesState extends State<Dating_dates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Dating Dates"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Dating Dates"),
        ),
      ),
    );
  }
}
