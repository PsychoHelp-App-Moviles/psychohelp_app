import 'package:flutter/material.dart';
import 'package:psychohelp_app/pages/psychologist/list_patients.dart';

class Patients_psycho extends StatefulWidget {
  static const String routeName = "/patients_psycho";
  @override
  State<Patients_psycho> createState() => _Patients_psychoState();
}

class _Patients_psychoState extends State<Patients_psycho> {
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
            new Icon(Icons.person_off_outlined), "Profile", "/profile_psycho"),
        getItem(new Icon(Icons.people), "List patients", "/list_patients"),
        getItem(new Icon(Icons.date_range), "Dating dates", "/dating_dates"),
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
        title: new Text("List of Patients"),
      ),
      body: List_patients(),
      drawer: new Drawer(
        child: getDrawer(context),
      ),
    );
  }
}
