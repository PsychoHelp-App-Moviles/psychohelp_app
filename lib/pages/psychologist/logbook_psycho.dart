import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/models/appointment.dart';
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
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        patient = ModalRoute.of(context)?.settings.arguments as Patient;
      });
      fetchAppointments(patient!.id);
      });
  }
  
  void fetchAppointments(int id) {
    httpHelper.fetchPatientAppointments(id).then((value) {
      setState(() {
        this.appointments = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Logbook of the patient"),
      ),
      body: new Container(
        margin: EdgeInsetsDirectional.only(start: 5, end: 5, top: 20),
        child: new Flex(
          direction: Axis.vertical,
          children: <Widget>[
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
            /*Container(
              margin: EdgeInsetsDirectional.only(top: 10, bottom: 10, start: 30, end: 30),
              child: Image.network(patient!.img)),*/
            new Flex(direction: Axis.horizontal, children: <Widget>[
              new Flexible(
                flex: 3,
                child: new Container(
                  margin: EdgeInsetsDirectional.only(top: 10, bottom: 10, start: 30, end: 30),
                  child: Image.network(patient!.img),
                ),
              ),
              new Flexible(
                flex: 1,
                child: new Container(
                  child: ListView.builder(
                    shrinkWrap:true,
                    itemCount: appointments.length,         
                    itemBuilder: (context, index) {                                          
                  return AppointmentsRow(appointment: appointments[index]);
                  },),)
                ),]
              ),
            ]),                
      )
    );
  }
}

class AppointmentsRow extends StatelessWidget {
  final Appointment appointment;
  const AppointmentsRow({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsetsDirectional.only(top: 20, bottom: 15, start: 75, end: 75),
      child: new InkWell(
        onTap: () {
          
        },
        child: Column(children: <Widget>[
        Text(appointment.scheduleDate),
      ]),
      )
    );
  }
}


