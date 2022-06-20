import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/pages/patient/edit_profile_patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_patient extends StatefulWidget {
  static const String routeName = "/profile_patient";
  @override
  State<Profile_patient> createState() => _Profile_patientState();
}

class _Profile_patientState extends State<Profile_patient> {
  HttpHelper httpHelper = HttpHelper();
  Patient patient = Patient(
      id: 1,
      firstName: "",
      lastName: "",
      email: "",
      phone: "",
      password: "",
      date: "",
      gender: "",
      img: "");

  @override
  void initState() {
    httpHelper = HttpHelper();
    fetchPatient();
    super.initState();
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditPatientProfile(patient),
        ));
    setState(() {
      patient = result as Patient;
    });
  }

  Future fetchPatient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      patient = Patient.fromJson(
          jsonDecode(prefs.getString('patient')!) as Map<String, dynamic>);
    });
    return patient;
  }

  @override
  Widget build(BuildContext context) {
    if (patient.firstName == "") {
      return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(patient.img),
                radius: 75.0,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    patient.firstName + " " + patient.lastName,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email: " + patient.email,
                              style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 10),
                          Text("Phone: " + patient.phone,
                              style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 10),
                          Text("Birthday: " + patient.date,
                              style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 10),
                          Text("Gender: " + patient.gender,
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
                          style: TextStyle(fontSize: 20.0)))
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
