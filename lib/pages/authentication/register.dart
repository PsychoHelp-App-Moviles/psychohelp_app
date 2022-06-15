import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/psychologist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

import '../../models/patient.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const String routeName = "/register";
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  HttpHelper httpHelper = HttpHelper();

  final myEmail = TextEditingController();
  final myPassword = TextEditingController();

  //Psychologist register credentials
  @override
  void initState() {
    myEmail.text = "fano@gmail.com";
    myPassword.text = "password";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: new Text("Register"),
        ),
      ),
    );
  }
}
