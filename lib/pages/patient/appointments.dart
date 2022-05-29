import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  static const String routeName = "/appointments";
  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Appointments"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Appointments"),
        ),
      ),
    );
  }
}
