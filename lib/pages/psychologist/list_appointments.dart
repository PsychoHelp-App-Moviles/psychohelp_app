import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppointmentList extends StatefulWidget {
  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List appointments = [];
  List patients = [];
  DateTime date = DateTime.now();
  HttpHelper httpHelper = HttpHelper();
  bool _isShown = true;
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

  @override
  void initState() {
    appointments = [];
    patients = [];
    httpHelper = HttpHelper();
    fetchAppointments();
    fetchPatients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        Patient patient = patients.firstWhere(
            (element) => element.id == appointments[index].patientId);
        return Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Column(children: [
                        RichText(
                          text: TextSpan(
                            text: 'Cita programada: ' +
                                appointments[index].scheduleDate,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Paciente: ' +
                                patient.firstName +
                                ' ' +
                                patient.lastName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )
                      ])),
                  Align(
                    alignment: Alignment.center,
                    child: MaterialButton(
                        onPressed: () {
                          String url = 'https://meet.google.com/new';
                          launchUrlString(url);
                        },
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Google_Meet_icon_%282020%29.svg/2491px-Google_Meet_icon_%282020%29.svg.png',
                          width: 20,
                          height: 20,
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              firstDate: date,
                              initialDate: date,
                              lastDate: DateTime(
                                  date.year, date.month, date.day + 14));

                          if (newDate == null) return;

                          setState(() => date = newDate);
                          print(newDate);
                        },
                        icon: Icon(Icons.calendar_month),
                        color: Colors.blueAccent),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  title: const Text('Borrando cita'),
                                  content: const Text(
                                      '¿Está seguro de borrar la cita, su paciente se puede morir?'),
                                  actions: [
                                    // The "Yes" button
                                    TextButton(
                                        onPressed: () {
                                          // Remove the box
                                          setState(() {
                                            _isShown = false;
                                          });
                                          deleteAppointmentById(
                                              appointments[index].id, index);
                                          // Close the dialog
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Yes')),
                                    TextButton(
                                        onPressed: () {
                                          // Close the dialog
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'))
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                      )),
                ]),
          ),
        );
      },
    );
  }

  void fetchAppointments() {
    httpHelper.fetchAppointmentsByPsychologistId(1).then((value) {
      setState(() {
        this.appointments = value;
      });
    });
  }

  void fetchPatients() {
    httpHelper.fetchPatients().then((value) {
      setState(() {
        this.patients = value;
      });
    });
  }

  void deleteAppointmentById(int id, int index) {
    httpHelper.deleteAppointmentById(id);
    setState(() {
      appointments.removeAt(index);
    });
  }

  void fetchPatientById(int id) async {
    httpHelper.fetchPatientById(id).then((value) {
      setState(() {
        this.patient = value;
      });
    });
  }
}
