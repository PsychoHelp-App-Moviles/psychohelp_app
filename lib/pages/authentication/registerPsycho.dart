import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class RegisterPsycho extends StatefulWidget {
  const RegisterPsycho({Key? key}) : super(key: key);
  static const String routeName = "/psychoRegister";

  @override
  State<RegisterPsycho> createState() => _RegisterPsychoState();
}

class _RegisterPsychoState extends State<RegisterPsycho> {
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
