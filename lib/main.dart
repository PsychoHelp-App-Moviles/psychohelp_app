import 'package:flutter/material.dart';
import 'package:psychohelp_app/pages/authentication/login.dart';
import 'package:psychohelp_app/pages/authentication/register.dart';
import 'package:psychohelp_app/pages/authentication/registerPatient.dart';
import 'package:psychohelp_app/pages/authentication/registerPsycho.dart';
import 'package:psychohelp_app/pages/patient/appointments.dart';
import 'package:psychohelp_app/pages/patient/dating_dates_patient.dart';
import 'package:psychohelp_app/pages/patient/home_patient.dart';
import 'package:psychohelp_app/pages/patient/logbook_patient.dart';
import 'package:psychohelp_app/pages/patient/list_psycho.dart';
import 'package:psychohelp_app/pages/patient/profile_patient.dart';
import 'package:psychohelp_app/pages/psychologist/dating_dates.dart';
import 'package:psychohelp_app/pages/psychologist/home_psycho.dart';
import 'package:psychohelp_app/pages/psychologist/list_patients.dart';
import 'package:psychohelp_app/pages/psychologist/logbook_psycho.dart';
import 'package:psychohelp_app/pages/psychologist/my_publications.dart';
import 'package:psychohelp_app/pages/psychologist/profile_psycho.dart';
import 'package:psychohelp_app/pages/videocall/call.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey =
      'pk_test_51JxFdHE3DueU8pu3V9DMyx0VUOZEFxUGMEjGqsPakEilVuRQQ8FH8wYUb8Valy6DQr4ykdCXhZnuAvLM7UFJZmGt00g9v8mDwj';
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: new Login(),
      routes: <String, WidgetBuilder>{
        Home_patient.routeName: (BuildContext context) => new Home_patient(),
        Home_psycho.routeName: (BuildContext context) => new Home_psycho(),
        Dating_dates.routeName: (BuildContext context) => new Dating_dates(),
        Dating_dates_patient.routeName: (BuildContext context) =>
            new Dating_dates_patient(),
        List_patients.routeName: (BuildContext context) => new List_patients(),
        List_psycho.routeName: (BuildContext context) => new List_psycho(),
        Appointments.routeName: (BuildContext context) => new Appointments(),
        Profile_patient.routeName: (BuildContext context) =>
            new Profile_patient(),
        Profile_psycho.routeName: (BuildContext context) =>
            new Profile_psycho(),
        Logbook_psycho.routeName: (BuildContext context) =>
            new Logbook_psycho(),
        Logbook_patient.routeName: (BuildContext context) =>
            new Logbook_patient(),
        My_publications.routeName: (BuildContext context) =>
            new My_publications(),
        Login.routeName: (BuildContext context) => new Login(),
        Register.routeName: (BuildContext context) => new Register(),
        RegisterPatient.routeName: (BuildContext context) =>
            new RegisterPatient(),
        RegisterPsycho.routeName: (BuildContext context) =>
            new RegisterPsycho(),
        Call.routeName: (BuildContext context) => new Call(),
      }));
}
