import 'package:flutter/material.dart';

class My_publications extends StatefulWidget {
  static const String routeName = "/my_publications";
  @override
  State<My_publications> createState() => _My_publicationsState();
}

class _My_publicationsState extends State<My_publications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("my_publications"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("my_publications"),
        ),
      ),
    );
  }
}
