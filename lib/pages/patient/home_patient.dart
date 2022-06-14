import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/pages/psychologist/publication_list.dart';

class Home_patient extends StatefulWidget {
  Home_patient({Key? key, required this.patient}) : super(key: key);
  @override
  State<Home_patient> createState() => _Home_patientState();
  int patient;
  static const String routeName = "/home_patient";
}

class _Home_patientState extends State<Home_patient> {
  late Patient patient;

  @override
  void initState() {
    patient = new Patient(
        id: 1,
        firstName: "Santiago",
        lastName: "Cuentas",
        email: "email",
        phone: "phone",
        password: "password",
        date: "date",
        gender: "gender",
        img:
            "https://cdns-images.dzcdn.net/images/artist/8fd2490e2612a5ca852d3026b58465fa/500x500.jpg");
    super.initState();
  }

  Drawer getDrawer(BuildContext context) {
    var header = new DrawerHeader(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("PsychoHelp",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bienvenido,",
                style: TextStyle(fontSize: 20.0, color: Colors.white)),
            Container(
              margin: EdgeInsets.only(top: 4.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(patient.img),
                    radius: 20.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(patient.firstName + " " + patient.lastName,
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                ],
              ),
            )
          ],
        )
      ]),
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
            Navigator.of(context).pushNamed(route, arguments: widget.patient);
          });
        },
      );
    }

    ListView listView = new ListView(
      children: <Widget>[
        header,
        getItem(new Icon(Icons.home), "Home", "/home_patient"),
        getItem(new Icon(Icons.person_outlined), "Profile", "/profile_patient"),
        getItem(new Icon(Icons.people), "Psychologists list", "/list_psycho"),
        getItem(new Icon(Icons.date_range), "My appointments", "/appointments"),
        getItem(new Icon(Icons.date_range), "Logbook", "/logbook_patient"),
        getItem(new Icon(Icons.logout), "Logout", "/login"),
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
        title: new Text("Home patient"),
      ),
      body: PublicationList(),
      drawer: new Drawer(
        child: getDrawer(context),
      ),
    );
  }
}
