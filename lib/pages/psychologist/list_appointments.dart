import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppointmentList extends StatefulWidget {
  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List appointments = [];
  HttpHelper httpHelper = HttpHelper();

  launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                      child: Text('Cita programada: ' +
                          appointments[index].scheduleDate)),
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
                  Column(children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text('Actualizar'),
                      ),
                    )
                  ]),
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
}
