import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppointmentListPatient extends StatefulWidget {
  @override
  State<AppointmentListPatient> createState() => _AppointmentListPatientState();
}

class _AppointmentListPatientState extends State<AppointmentListPatient> {
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
  Widget build(BuildContext context) {
    if (appointments.length == 0) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
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
                              text:
                                  'Fecha: ' + appointments[index].scheduleDate,
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
                            Navigator.of(context).pushNamed('/call');
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Google_Meet_icon_%282020%29.svg/2491px-Google_Meet_icon_%282020%29.svg.png',
                            width: 20,
                            height: 20,
                          )),
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
                            Appointment appointmentInfo = Appointment(
                              id: appointments[index].id,
                              meetUrl: appointments[index].meetUrl,
                              motive: appointments[index].motive,
                              personalHistory:
                                  appointments[index].personalHistory,
                              testRealized: appointments[index].testRealized,
                              treatment: appointments[index].treatment,
                              scheduleDate: newDateString,
                              patientId: appointments[index].patientId,
                              psychologistId:
                                  appointments[index].psychologistId,
                            );

                            updateAppointment(appointments[index].id, index,
                                newDateString, appointmentInfo);
                            //fetchAppointmentNoFuture();
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
                                              //appointments.removeAt(index);
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
  }

  Future fetchAppointments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    httpHelper.fetchAppointmentsByPatientId(id!).then((value) {
      setState(() {
        this.appointments = value;
      });
    });
  }

  void updateAppointment(
      int id, int index, String dateTime, Appointment appointment) {
    httpHelper.updateAppointment(id, appointment);
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
}
