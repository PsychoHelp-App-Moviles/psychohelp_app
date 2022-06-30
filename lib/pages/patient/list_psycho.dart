// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:psychohelp_app/models/patient.dart';

import '../../controller/payment_controller.dart';

class List_psycho extends StatefulWidget {
  static const String routeName = "/list_psycho";
  @override
  State<List_psycho> createState() => _List_psychoState();
}

class _List_psychoState extends State<List_psycho> {
  List psychologists = [];
  List appointment = [];
  int patientId = 0;
  HttpHelper httpHelper = HttpHelper();
  DateTime selectedDate = DateTime.now();

  var controllerAppointment = TextEditingController();
  final TextEditingController controllerUrl = TextEditingController();
  final TextEditingController controllerMotive = TextEditingController();
  final TextEditingController controllerPersonalHistory =
      TextEditingController();
  final TextEditingController controllerTestRealized = TextEditingController();
  final TextEditingController controllerTreatment = TextEditingController();
  final TextEditingController controllerScheduleDate = TextEditingController();

  @override
  void initState() {
    psychologists = [];
    httpHelper = HttpHelper();
    fetchPsychologists();
    getPatientId();
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(
            selectedDate.year, selectedDate.month, selectedDate.day + 7));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controllerAppointment.text = formatDate(
            selectedDate, [dd, '/', mm, '/', yy]);
        //selectedDate.toString().substring(0, 10);
      });
    }

  }

  void fetchPsychologists() {
    httpHelper.fetchPsychologist().then((value) {
      setState(() {
        this.psychologists = value;
      });
    });
  }

  Future getPatientId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final patient = Patient.fromJson(
          jsonDecode(prefs.getString('patient')!) as Map<String, dynamic>);
      patientId = patient.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Psychologists list"),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(30.0),
            itemCount: psychologists.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(psychologists[index].img)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(psychologists[index].name),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(psychologists[index].cmp),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Text("See more"),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      )),
                                      title: Text(
                                        "Detalles del psicólogo",
                                        textAlign: TextAlign.center,
                                      ),
                                      contentPadding: EdgeInsets.all(16.0),
                                      children: <Widget>[
                                        CircleAvatar(
                                            radius: 75,
                                            backgroundImage: NetworkImage(
                                                psychologists[index].img)),
                                        Text("Nombre: ",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: "Roboto",
                                                color: Colors.blue[900]),
                                            textAlign: TextAlign.start),
                                        Text(psychologists[index].name),
                                        SizedBox(height: 5.0),
                                        Text("CMP",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: "Roboto",
                                                color: Colors.blue[900])),
                                        Text(psychologists[index].cmp),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "DNI",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].dni),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Teléfono",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].phone),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Especialidad",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index]
                                            .specialization),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Formación",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].formation),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Acerca de mí",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].about),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Tipo de Sesión",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].sessionType)
                                      ]));
                        },
                      ),
                      FlatButton(
                        child: Text("Agendar cita"),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    )),
                                    title: Text(
                                      "Detalles de la cita",
                                      textAlign: TextAlign.center,
                                    ),
                                    children: <Widget>[
                                      TextField(
                                        controller: controllerAppointment,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 13, vertical: 10),
                                          border: OutlineInputBorder(),
                                          labelText: 'Appointment Date',
                                          hintText:
                                              'Enter your Appointment Date',
                                          suffixIcon: IconButton(
                                              splashRadius: 20,
                                              icon: Icon(
                                                Icons.date_range,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                _selectDate(context);
                                              }),
                                        ),
                                      ),
                                      ElevatedButton(
                                        child: Text("Agendar"),
                                        onPressed: () async {
                                          String meetUrl = "string";
                                          String motive = "string";
                                          String personalHistory = "string";
                                          String testRealized = "string";
                                          String treatment = "string";
                                          String date =
                                              controllerAppointment.text;
                                          Appointment request = Appointment(
                                              id: 1,
                                              meetUrl: meetUrl,
                                              motive: motive,
                                              personalHistory: personalHistory,
                                              testRealized: testRealized,
                                              treatment: treatment,
                                              scheduleDate: date,
                                              patientId: patientId,
                                              psychologistId:
                                                  psychologists[index].id);
                                          controller.makePayment(
                                              amount: '50', currency: 'PEN');
                                          await httpHelper.createAppointment(
                                              request,
                                              patientId,
                                              psychologists[index].id);
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ));
                        },
                      ),
                    ],
                  )
                ]),
              );
            }));
  }
}
