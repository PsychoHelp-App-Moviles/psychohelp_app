import 'package:flutter/material.dart';

class List_patients extends StatefulWidget {
  static const String routeName = "/list_patients";
  @override
  State<List_patients> createState() => _List_patientsState();
}

class _List_patientsState extends State<List_patients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("List of Patients"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("List of Patients"),
        ),
      ),
    );
  }
}
