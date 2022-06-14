import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:psychohelp_app/models/psychologist.dart';
import 'package:psychohelp_app/pages/psychologist/publication_list.dart';

class Home_psycho extends StatefulWidget {
  Home_psycho({Key? key, required this.psychologist}) : super(key: key);
  @override
  State<Home_psycho> createState() => _Home_psychoState();
  int psychologist;
  static const String routeName = "/home_psycho";
}

class _Home_psychoState extends State<Home_psycho> {
  late Psychologist psychologist;

  @override
  void initState() {
    psychologist = new Psychologist(
        id: 1,
        name: "Jose Pain",
        dni: "1123312",
        birthday: "string",
        email: "string",
        password: "string",
        phone: "string",
        specialization: "string",
        formation: "string",
        about: "string",
        gender: "string",
        sessionType: "string",
        img: "https://cdn.freestyleko.com/player/sweet_pain.jpg",
        cmp: "123123",
        active: true,
        fresh: true);
    super.initState();
  }

  Drawer getDrawer(BuildContext context) {
    var header = DrawerHeader(
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
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
                      backgroundImage: NetworkImage(psychologist.img),
                      radius: 20.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(psychologist.name,
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
      decoration: new BoxDecoration(
        color: Colors.blue,
      ),
    );

    Container getItem(Icon icon, String description, String route) {
      return Container(
        padding: EdgeInsets.only(left: 10.0),
        child: ListTile(
          leading: icon,
          title: new Text(description),
          onTap: () {
            setState(() {
              Navigator.of(context).pushNamed(route);
            });
          },
        ),
      );
    }

    ListView listView = new ListView(
      children: [
        header,
        getItem(new Icon(Icons.home), "Home", "/home_psycho"),
        getItem(new Icon(Icons.person), "Profile", "/profile_psycho"),
        getItem(new Icon(Icons.people), "Patient list", "/list_patients"),
        getItem(new Icon(Icons.date_range), "My appointments", "/dating_dates"),
        getItem(new Icon(Icons.public), "My publications", "/my_publications"),
        getItem(new Icon(Icons.logout), "Logout", "/login"),
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
        title: new Text("Home psychologist"),
      ),
      body: PublicationList(),
      drawer: new Drawer(
        child: getDrawer(context),
      ),
    );
  }
}
