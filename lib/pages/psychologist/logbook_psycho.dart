import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class Logbook_psycho extends StatefulWidget {
  static const String routeName = "/logbook_psycho";
  @override
  State<Logbook_psycho> createState() => _Logbook_psychoState();
}

class _Logbook_psychoState extends State<Logbook_psycho> {
  Patient? patient;
  List appointments = [];
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    appointments = [];
    httpHelper = HttpHelper();
    fetchAppointments();
    super.initState();
  }

  @override
  /*Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return PublicationRow(publication: appointments[index]);
      },
    );
  }*/

  void fetchAppointments() {
    httpHelper.fetchPatientAppointments(patient!.id).then((value) {
      setState(() {
        this.appointments = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    patient = ModalRoute.of(context)?.settings.arguments as Patient;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Logbook of the patient"),
      ),
      body: new Container(
        margin: EdgeInsetsDirectional.only(start: 5, end: 5, top: 20),
        child: new Flex(direction: Axis.vertical, children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "Identification Data",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Identification Data",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Identification Data",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
              margin: EdgeInsetsDirectional.only(
                  top: 10, bottom: 10, start: 30, end: 30),
              child: Image.network(patient!.img)),
          Card(),
        ]),
      ),
    );
  }
}
