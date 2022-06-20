import 'package:flutter/material.dart';
import 'package:psychohelp_app/pages/patient/list_appointments_patient.dart';

class Dating_dates_patient extends StatefulWidget {
  static const String routeName = "/dating_dates_patient";
  @override
  State<Dating_dates_patient> createState() => _Dating_dates_patientState();
}

class _Dating_dates_patientState extends State<Dating_dates_patient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Appointment list"),
        ),
        body: new AppointmentListPatient());
  }
}
