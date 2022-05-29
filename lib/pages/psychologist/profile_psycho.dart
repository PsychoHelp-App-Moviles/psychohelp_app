import 'package:flutter/material.dart';

class Profile_psycho extends StatefulWidget {
  static const String routeName = "/profile_psycho";
  @override
  State<Profile_psycho> createState() => _Profile_psychoState();
}

class _Profile_psychoState extends State<Profile_psycho> {
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
