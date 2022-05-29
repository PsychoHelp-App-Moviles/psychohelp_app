import 'package:flutter/material.dart';

class Home_patient extends StatefulWidget {
  @override
  State<Home_patient> createState() => _Home_patientState();
}

class _Home_patientState extends State<Home_patient> {
  Drawer getDrawer(BuildContext context) {
    var header = new DrawerHeader(
      child: new Text("PsychoHelp"),
      decoration: new BoxDecoration(
        color: Colors.blue,
      ),
    );

    ListTile getItem(Icon icon, String description, String route) {
      return new ListTile(
        leading: icon,
        title: new Text(description),
        onTap: () {
          setState(() {
            Navigator.of(context).pushNamed(route);
          });
        },
      );
    }

    ListView listView = new ListView(
      children: <Widget>[
        header,
        getItem(new Icon(Icons.home), "Home", "/"),
        getItem(
            new Icon(Icons.person_off_outlined), "Profile", "/profile_patient"),
        getItem(new Icon(Icons.people), "List psychologists", "/list_psycho"),
        getItem(new Icon(Icons.date_range), "Appointments", "/appointments"),
      ],
    );

    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home_patient"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Home_patient"),
        ),
      ),
      drawer: new Drawer(
        child: getDrawer(context),
      ),
    );
  }
}