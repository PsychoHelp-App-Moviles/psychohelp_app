import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppointmentList extends StatefulWidget {
  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List appointments = [];
  List patients = [];

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
                            text: 'Fecha: ' + appointments[index].scheduleDate,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ])),
                  Align(
                    alignment: Alignment.centerLeft,
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  title: Text(
                                    'Detalles del paciente',
                                    textAlign: TextAlign.center,
                                  ),
                                  contentPadding: EdgeInsets.all(16.0),
                                  insetPadding: EdgeInsets.all(10.0),
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Image border
                                              child: SizedBox.fromSize(
                                                size: Size.fromRadius(
                                                    100), // Image radius
                                                child: Image.network(
                                                    patient.img,
                                                    width: 200,
                                                    height: 100,
                                                    fit: BoxFit.cover),
                                              ),
                                            )),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Nombre: ' +
                                                  patient.firstName +
                                                  ' ' +
                                                  patient.lastName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: RichText(
                                              text: TextSpan(
                                            text: 'Edad: ' +
                                                calculaEdad(patient.date)
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: RichText(
                                              text: TextSpan(
                                            text: 'Email: ' + patient.email,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: RichText(
                                              text: TextSpan(
                                            text: 'Celular: ' + patient.phone,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: RichText(
                                              text: TextSpan(
                                            text: 'Motivo de la consulta: ' +
                                                appointments[index].motive,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: RichText(
                                              text: TextSpan(
                                            text: 'Tratamiento: ' +
                                                appointments[index].treatment,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                        )
                                      ],
                                    ),
                                  ],
                                ));
                      },
                      icon: Icon(Icons.person),
                      color: Colors.green,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () async {
                          DateTime date = new DateFormat('dd/MM/yyyy')
                              .parse(appointments[index].scheduleDate);

                          DateTime? newDate = await showDatePicker(
                              context: context,
                              firstDate: date,
                              initialDate: date,
                              lastDate: DateTime(
                                  date.year, date.month, date.day + 14));

                          if (newDate == null) return;

                          setState(() => date = newDate);
                          String newDateString =
                              formatDate(newDate, [dd, '/', mm, '/', yy]);
                          updateAppointment(appointments[index].id, index,
                              newDateString, appointments[index]);
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
                                      '¿Está seguro de borrar la cita?'),
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

  void updateAppointment(
      int id, int index, String dateTime, Appointment appointment) {
    httpHelper.updateAppointment(id, appointment, dateTime);
    setState(() {
      appointments[index].scheduleDate = dateTime.toString();
    });
  }

  void deleteAppointmentById(int id, int index) {
    httpHelper.deleteAppointmentById(id);
    setState(() {
      appointments.removeAt(index);
    });
  }

  int calculaEdad(String birthDateString) {
    DateTime birthDate =
        DateTime.parse(birthDateString.split('/').reversed.join());
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  void fetchPatientById(int id) async {
    httpHelper.fetchPatientById(id).then((value) {
      setState(() {
        this.patient = value;
      });
    });
  }
}
