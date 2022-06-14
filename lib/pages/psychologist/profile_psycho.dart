import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/psychologist.dart';

class Profile_psycho extends StatefulWidget {
  static const String routeName = "/profile_psycho";
  @override
  State<Profile_psycho> createState() => _Profile_psychoState();
}

class _Profile_psychoState extends State<Profile_psycho> {
  late Psychologist psychologist;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(psychologist.img),
                      radius: 75.0,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          psychologist.name,
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              children: [
                                Text("Email: " + psychologist.email,
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(height: 10),
                                Text("Phone: " + psychologist.phone,
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(height: 10),
                                Text("Birthday: " + psychologist.birthday,
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(height: 10),
                                Text("Gender: " + psychologist.gender,
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(height: 10),
                                Text("Specialization: " + psychologist.gender,
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(height: 10),
                                Text("Formation: " + psychologist.gender,
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(height: 10),
                                Text("CMP: " + psychologist.gender,
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(height: 10),
                                Text("Session type: " + psychologist.gender,
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(height: 10),
                                Text("About: " + psychologist.gender,
                                    style: TextStyle(fontSize: 20.0)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton.icon(
                            onPressed: () {
                              setState(() => {});
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              size: 25,
                            ),
                            label: Text("Edit profile",
                                style: TextStyle(fontSize: 20.0)))
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
