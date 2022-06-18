import 'package:flutter/material.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const String routeName = "/register";
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  HttpHelper httpHelper = HttpHelper();

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
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text('Elige si eres psicólogo',
                    style: TextStyle(fontSize: 18, height: 0.5)),
              ),
              Card(
                  margin: EdgeInsetsDirectional.only(
                      top: 10, bottom: 10, start: 57, end: 57),
                  child: new InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/psychoRegister');
                    },
                    child: Column(children: <Widget>[
                      Container(
                          margin: EdgeInsetsDirectional.only(
                              top: 10, bottom: 10, start: 10, end: 10),
                          child: Image.network(
                            "https://static.vecteezy.com/system/resources/previews/002/921/526/original/depressed-woman-sitting-on-chair-psychologist-doctor-consulting-patient-in-therapy-session-online-psychotherapy-counseling-concept-mental-health-depression-human-mental-problem-solutions-vector.jpg",
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )),
                    ]),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Text('o paciente',
                    style: TextStyle(fontSize: 18, height: 1)),
              ),
              Card(
                  margin: EdgeInsetsDirectional.only(top: 10, bottom: 10),
                  child: new InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/patientRegister');
                    },
                    child: Column(children: <Widget>[
                      Container(
                          margin: EdgeInsetsDirectional.only(
                              top: 10, bottom: 10, start: 10, end: 10),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaSM1kabpkvUSejLRD5MMpc-_moKxfJ1Bs2w&usqp=CAU",
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )),
                    ]),
                  )),
            ]))),
      ),
    );
  }
}
