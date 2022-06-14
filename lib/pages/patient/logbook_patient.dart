import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class Logbook_patient extends StatefulWidget {
  static const String routeName = "/logbook_patient";
  @override
  State<Logbook_patient> createState() => _Logbook_patientState();
}

class _Logbook_patientState extends State<Logbook_patient> {
  Patient patient = new Patient(
      id: 0,
      firstName: '',
      lastName: '',
      email: '',
      phone: '',
      password: '',
      date: '',
      gender: '',
      img: '');
  int patientId = 0;
  List appointments = [];
  Appointment appointmentInfo = Appointment(
      id: 1,
      meetUrl: "",
      motive: "",
      personalHistory: "",
      testRealized: "",
      treatment: "",
      scheduleDate: "",
      patientId: 1,
      psychologistId: 1);
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    appointments = [];
    httpHelper = HttpHelper();
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        patientId = ModalRoute.of(context)?.settings.arguments as int;
      });
      fetchAppointments(patientId);
      fetchPatientById(patientId);
    });
  }

  void fetchPatientById(int id) {
    httpHelper.fetchPatientById(id).then((value) {
      setState(() {
        this.patient = value;
      });
    });
  }

  Future fetchAppointments(int id) async {
    appointments = await httpHelper.fetchAppointmentsByPatientId(id);
    return appointments;
  }

  void fetchAppointmentById(int id) {
    httpHelper.fetchAppointmentById(id).then((value) {
      setState(() {
        this.appointmentInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Logbook of the patient"),
        ),
        resizeToAvoidBottomInset: false,
        body: new Container(
          margin: EdgeInsetsDirectional.only(start: 15, end: 15, top: 20),
          child: new Flex(direction: Axis.vertical, children: <Widget>[
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Identification Data",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 15),
                Card(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Nombre Completo: " +
                                    patient.firstName +
                                    " " +
                                    patient.lastName,
                                style: TextStyle(fontSize: 16),
                                //set an id for the text
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Fecha de Nacimiento: " + patient.date,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Correo electrónico: " + patient.email,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Género: " + patient.gender,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Teléfono: " + patient.phone,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ))),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Historial de Sesiones",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            new Flex(direction: Axis.horizontal, children: <Widget>[
              new Flexible(
                  flex: 1,
                  child: new Container(
                      width: 100,
                      margin: EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, start: 10, end: 15),
                      child: FutureBuilder(
                        future: fetchAppointments(patient.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              padding: EdgeInsets.only(bottom: 20),
                              shrinkWrap: true,
                              itemCount: appointments.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    child: new InkWell(
                                  onTap: () {
                                    fetchAppointmentById(
                                        appointments[index].id);
                                  },
                                  child: Column(children: <Widget>[
                                    Text(appointments[index].scheduleDate),
                                  ]),
                                ));
                              },
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ))),
              new Flexible(
                flex: 2,
                child: new Container(
                  width: 400,
                  child: new Card(
                    margin:
                        EdgeInsetsDirectional.only(top: 10, start: 5, end: 5),
                    child: new Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 10, start: 10, end: 10),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Schedule: " + appointmentInfo.scheduleDate,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Motive: " + appointmentInfo.motive,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "History: " + appointmentInfo.personalHistory,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Test: " + appointmentInfo.testRealized,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Treatment: " + appointmentInfo.treatment,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ]),
        ));
  }
}
