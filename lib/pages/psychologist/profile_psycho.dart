import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/psychologist.dart';
import 'package:psychohelp_app/pages/psychologist/edit_profile_psycho.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_psycho extends StatefulWidget {
  static const String routeName = "/profile_psycho";
  @override
  State<Profile_psycho> createState() => _Profile_psychoState();
}

class _Profile_psychoState extends State<Profile_psycho> {
  HttpHelper httpHelper = HttpHelper();
  Psychologist psychologist = new Psychologist(
      id: 1,
      name: "",
      dni: "",
      birthday: "",
      email: "",
      password: "",
      phone: "",
      specialization: "",
      formation: "",
      about: "",
      gender: "",
      sessionType: "",
      img: "",
      cmp: "",
      active: true,
      fresh: true);

  @override
  void initState() {
    httpHelper = HttpHelper();
    super.initState();
    fetchPsychologistById();
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditedPsychoProfile(psychologist),
        ));
    setState(() {
      fetchPublicationById(psychologist.id);
    });
  }

  Future fetchPsychologistById() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    httpHelper.fetchPsychologistById(id!).then((value) {
      setState(() {
        this.psychologist = value;
      });
    });
  }

  void fetchPublicationById(int id) {
    httpHelper.fetchPublicationById(id).then((value) {
      setState(() {
        this.psychologist = value;
      });
    });
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
                            _navigateAndDisplaySelection(context);
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            size: 25,
                          ),
                          label: Text("Edit profile",
                              style: TextStyle(fontSize: 20.0)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
