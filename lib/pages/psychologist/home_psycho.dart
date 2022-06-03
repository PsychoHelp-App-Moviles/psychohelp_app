import 'package:flutter/material.dart';
import 'package:psychohelp_app/pages/psychologist/publication_list.dart';

class Home_psycho extends StatefulWidget {
  @override
  State<Home_psycho> createState() => _Home_psychoState();
}

class _Home_psychoState extends State<Home_psycho> {
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
        getItem(new Icon(Icons.public), "My Publications", "/my_publications"),
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
        title: new Text("Home_psycho"),
      ),
      body: PublicationList(),
      drawer: new Drawer(
        child: getDrawer(context),
      ),
    );
  }
}
