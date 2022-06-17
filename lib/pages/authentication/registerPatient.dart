import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/psychologist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class RegisterPatient extends StatefulWidget {
  const RegisterPatient({Key? key}) : super(key: key);
  static const String routeName = "/patientRegister";

  @override
  State<RegisterPatient> createState() => _RegisterPatientState();
}

class _RegisterPatientState extends State<RegisterPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: new Text("Patient registration"),
        ),
      ),
    );
  }
}
