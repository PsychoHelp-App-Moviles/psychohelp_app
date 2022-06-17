import 'package:flutter/material.dart';

class List_psycho extends StatefulWidget {
  static const String routeName = "/list_psycho";
  @override
  State<List_psycho> createState() => _List_psychoState();
}

class _List_psychoState extends State<List_psycho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Psychologists list"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Psychologists list"),
        ),
      ),
    );
  }
}
