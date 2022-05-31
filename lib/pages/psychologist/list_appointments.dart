import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class AppointmentList extends StatefulWidget {
  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
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
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return AppointmentRow(appointment: appointments[index]);
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
}

class AppointmentRow extends StatelessWidget {
  final Appointment appointment;
  const AppointmentRow({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        Text(appointment.motive),
        Text(appointment.scheduleDate),
      ]),
    );
  }
}
