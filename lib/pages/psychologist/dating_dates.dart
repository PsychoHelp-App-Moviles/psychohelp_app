import 'package:flutter/material.dart';
import 'package:psychohelp_app/pages/psychologist/list_appointments.dart';

class Dating_dates extends StatefulWidget {
  static const String routeName = "/dating_dates";
  @override
  State<Dating_dates> createState() => _Dating_datesState();
}

class _Dating_datesState extends State<Dating_dates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Appointment list"),
        ),
        body: new AppointmentList());
  }
}
