import 'package:flutter/material.dart';

class Profile_patient extends StatefulWidget {
  static const String routeName = "/profile_patient";
  @override
  State<Profile_patient> createState() => _Profile_patientState();
}

class _Profile_patientState extends State<Profile_patient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Profile"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Profile"),
        ),
      ),
    );
  }
}
