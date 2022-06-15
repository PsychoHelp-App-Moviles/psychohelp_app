import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/psychologist.dart';
import 'package:psychohelp_app/pages/authentication/register.dart';
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

  late bool _passwordVisible;

  //Psychologist login credentials
  @override
  void initState() {
    _passwordVisible = false;
    myEmail.text = "fano@gmail.com";
    myPassword.text = "password";
    super.initState();
  }

  //Patient login credentials
  // @override
  // void initState() {
  //   _passwordVisible = false;
  //   myEmail.text = "santi@gmail.com";
  //   myPassword.text = "password";
  //   super.initState();
  // }

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
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home_patient(patient: patient.id),
              ));
        }
      }
    } catch (e) {
      print("Error al logear el paciente");
    }
    try {
      Psychologist? psycho = await getPsychologistByEmail(email);
      if (psycho != null) {
        if (psycho.password == password) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home_psycho(psychologist: psycho.id),
            ),
          );
        }
      }
    } catch (e) {
      print("Error al logear el psicologo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                          "https://terapiaapsicologica.com/wp-content/uploads/2020/12/Psychologist-bro.png",
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.28),
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
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text('Ingresa tu email y contraseña',
                            style: TextStyle(fontSize: 14, height: 0.5)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.06,
                        margin: EdgeInsets.only(bottom: 12.0),
                        child: TextField(
                          controller: myEmail,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Enter your email',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.06,
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: TextField(
                          controller: myPassword,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                }),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        child: Text('Iniciar sesión',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        onPressed: () =>
                            generalLogin(myEmail.text, myPassword.text),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No tiene una cuenta?'),
                          TextButton(
                            child: Text('Registrese aquí'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}
