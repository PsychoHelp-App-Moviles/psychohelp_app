import 'package:flutter/material.dart';
import 'package:psychohelp_app/pages/psychologist/publication_list.dart';

class Home_patient extends StatefulWidget {
  Home_patient({Key? key, required this.patient}) : super(key: key);
  @override
  State<Home_patient> createState() => _Home_patientState();
  int patient;
  static const String routeName = "/home_patient";
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
        getItem(new Icon(Icons.home), "Home", "/home_patient"),
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
    print(widget.patient);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home_patient"),
      ),
      body: PublicationList(),
      drawer: new Drawer(
        child: getDrawer(context),
      ),
    );
  }
}
