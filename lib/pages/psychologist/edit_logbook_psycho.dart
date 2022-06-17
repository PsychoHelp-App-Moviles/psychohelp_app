// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class Edit_Logbook_Appointment extends StatefulWidget {
  const Edit_Logbook_Appointment(this.appointment);
  final Appointment appointment;
  @override
  State<Edit_Logbook_Appointment> createState() =>
      _Edit_Logbook_AppointmentState();
}

class _Edit_Logbook_AppointmentState extends State<Edit_Logbook_Appointment> {
  HttpHelper httpHelper = HttpHelper();
  Appointment? appointment;

  final TextEditingController controllerMotive = TextEditingController();
  final TextEditingController controllerHistory = TextEditingController();
  final TextEditingController controllerTest = TextEditingController();
  final TextEditingController controllerTreatment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Edit logbook'),
      ),
      body: getBody(),
    );
  }

  @override
  void initState() {
    httpHelper = HttpHelper();
    controllerMotive.text = widget.appointment.motive;
    controllerTest.text = widget.appointment.testRealized;
    controllerTreatment.text = widget.appointment.treatment;
    controllerHistory.text = widget.appointment.personalHistory;
    super.initState();
  }

  Widget getBody() {
    return new ListView(
      controller: ScrollController(),
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        SizedBox(height: 16),
        TextField(
          controller: controllerMotive,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Motive',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerHistory,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'History',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerTest,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Test',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerTreatment,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Treatment',
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          child: Text('Edited'),
          onPressed: () async {
            String motive = controllerMotive.text;
            String history = controllerHistory.text;
            String testRealized = controllerTest.text;
            String treatment = controllerTreatment.text;

            Appointment appointmentInfo = Appointment(
              id: widget.appointment.id,
              meetUrl: widget.appointment.meetUrl,
              motive: motive,
              personalHistory: history,
              testRealized: testRealized,
              treatment: treatment,
              scheduleDate: widget.appointment.scheduleDate,
              patientId: widget.appointment.patientId,
              psychologistId: widget.appointment.psychologistId,
            );
            await httpHelper.updateAppointment(
                widget.appointment.id, appointmentInfo);

            Navigator.pop(context, appointmentInfo);
          },
        ),
      ],
    );
  }
}
