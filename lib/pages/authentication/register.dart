import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/psychologist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:psychohelp_app/models/patient.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const String routeName = "/register";
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  HttpHelper httpHelper = HttpHelper();

  final myName = TextEditingController();
  final myDni = TextEditingController();
  final myBirthday = TextEditingController();
  final myEmail = TextEditingController();
  final myPassword = TextEditingController();
  final myPhone = TextEditingController();
  final mySpecialization = TextEditingController();
  final myFormation = TextEditingController();
  final myAbout = TextEditingController();
  final myGender = TextEditingController();
  final mySessionType = TextEditingController();
  final myImg = TextEditingController();
  final myCmp = TextEditingController();

  //Psychologist register credentials
  @override
  void initState() {
    httpHelper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text('Sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text('Elige si eres psicólogo',
                    style: TextStyle(fontSize: 18, height: 0.5)),
              ),
              GestureDetector(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text("Psicólogo",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            backgroundColor: Color.fromARGB(150, 255, 255, 255),
                          )),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(1, 3),
                          ),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://static.vecteezy.com/system/resources/previews/002/921/526/original/depressed-woman-sitting-on-chair-psychologist-doctor-consulting-patient-in-therapy-session-online-psychotherapy-counseling-concept-mental-health-depression-human-mental-problem-solutions-vector.jpg"),
                            fit: BoxFit.cover),
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, '/psychoRegister');
                  }),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: Text('o paciente',
                    style: TextStyle(fontSize: 18, height: 1)),
              ),
              GestureDetector(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text("Paciente",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            backgroundColor: Color.fromARGB(150, 255, 255, 255),
                          )),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(1, 3),
                          ),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaSM1kabpkvUSejLRD5MMpc-_moKxfJ1Bs2w&usqp=CAU"),
                            fit: BoxFit.cover),
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, '/patientRegister');
                  }),
            ]))),
      ),
    );
  }
}
