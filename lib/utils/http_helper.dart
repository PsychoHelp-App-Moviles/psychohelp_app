import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/models/appointment.dart';
<<<<<<< HEAD
=======
import 'package:psychohelp_app/pages/patient/appointments.dart';
>>>>>>> 5f4b156659d2a3c3ad823711c9c8738e05512b4f

class HttpHelper {
  Future<List> fetchPublications() async {
    String urlString = 'https://psychohelp.herokuapp.com/api/v1/publications';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List publications =
          jsonResponse.map((map) => Publication.fromJson(map)).toList();
      return publications;
    }

    return [];
  }

  Future<List> fetchPatientsByPsychologistId(int id) async {
    String urlString = 'https://psychohelp-open.mybluemix.net/api/v1/appointment/psychologist/${id}/patient';
    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List patients =
          jsonResponse.map((map) => Patient.fromJson(map)).toList();
      return patients;
    }
    return [];
  }
    
    
  Future<List> fetchAppointmentsByPsychologistId(int id) async {
    String urlString = 'https://psychohelp.herokuapp.com/api/v1/appointment/psychologist/${id}';
    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List appointments =
          jsonResponse.map((map) => Appointment.fromJson(map)).toList();
      return appointments;
    }
    return [];
  }


  Future<List> fetchPatientAppointments(int id) async {
    String urlString = 'https://psychohelp-open.mybluemix.net/api/v1/appointment/patient/${id}';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);
     if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
<<<<<<< HEAD
=======
      List patients =
          jsonResponse.map((map) => Patient.fromJson(map)).toList();
      return patients;
     }
  return [];
}

  Future<List> fetchAppointmentsByPatientId(int id) async {
    String urlString = 'https://psychohelp.herokuapp.com/api/v1/appointment/patient/${id}';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
>>>>>>> 5f4b156659d2a3c3ad823711c9c8738e05512b4f
      List appointments =
          jsonResponse.map((map) => Appointment.fromJson(map)).toList();
      return appointments;
    }

    return [];
  }
}
