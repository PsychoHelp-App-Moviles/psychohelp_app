import 'package:flutter/material.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class List_psycho extends StatefulWidget {
  static const String routeName = "/list_psycho";
  @override
  State<List_psycho> createState() => _List_psychoState();
}

class _List_psychoState extends State<List_psycho> {
  List psychologists = [];
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    psychologists = [];
    httpHelper = HttpHelper();
    fetchPsychologists();
    super.initState();
  }

  void fetchPsychologists() {
    httpHelper.fetchPsychologist().then((value) {
      setState(() {
        this.psychologists = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Psychologists list"),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(15.0),
            itemCount: psychologists.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(psychologists[index].img)),
                  ),
                  Text(psychologists[index].name),
                  Text(psychologists[index].cmp),
                ]),
              );
            }));
  }
}
