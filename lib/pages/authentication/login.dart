import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/psychologist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:psychohelp_app/pages/patient/home_patient.dart';
import 'package:psychohelp_app/pages/psychologist/home_psycho.dart';

import '../../models/patient.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String routeName = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  HttpHelper httpHelper = HttpHelper();

  final myEmail = TextEditingController();
  final myPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<Patient?> getPatientByEmail(email) async {
    var patient = await httpHelper.fetchByPatientEmail(email);
    return patient;
  }

  Future<Psychologist?> getPsychologistByEmail(email) async {
    var psycho = await httpHelper.fetchByPsychologistEmail(email);
    return psycho;
  }

  void generalLogin(String email, String password) async {
    try {
      Patient? patient = await getPatientByEmail(email);
      if (patient != null) {
        if (patient.password == password) {
          Navigator.pushNamed(context, Home_patient.routeName);
        }
      }
    } catch (e) {
      print("ERRORSASO PACIENTE MANO XDD");
    }
    try {
      Psychologist? psycho = await getPsychologistByEmail(email);
      if (psycho != null) {
        if (psycho.password == password) {
          Navigator.pushNamed(context, Home_psycho.routeName);
        }
      }
    } catch (e) {
      print("ERRORSASO PSICOLOGO MANO XDD");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
                "https://terapiaapsicologica.com/wp-content/uploads/2020/12/Psychologist-bro.png",
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text('Psychohelp',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text('Ingresa tu email y contraseña'),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsets.only(bottom: 10.0),
              child: TextField(
                controller: myEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsets.only(bottom: 10.0),
              child: TextField(
                controller: myPassword,
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Iniciar sesión'),
              onPressed: () => generalLogin(myEmail.text, myPassword.text),
            ),
          ],
        ),
      ),
    );
  }
}
