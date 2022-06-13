import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/models/appointment.dart';
//import 'package:psychohelp_app/pages/patient/appointments.dart';

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
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/appointment/psychologist/${id}/patient';
    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List patients = jsonResponse.map((map) => Patient.fromJson(map)).toList();
      return patients;
    }
    return [];
  }

  Future<List> fetchAppointmentsByPsychologistId(int id) async {
    String urlString =
        'https://psychohelp.herokuapp.com/api/v1/appointment/psychologist/${id}';
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
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/appointment/patient/${id}';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List appointment =
          jsonResponse.map((map) => Appointment.fromJson(map)).toList();
      return appointment;
    }
    return [];
  }

  Future fetchAppointmentById(int id) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/appointment/${id}';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      var appointment = Appointment.fromJson(json.decode(response.body));
      return appointment;
    }
    return null;
  }

  Future updateAppointment(int id, Appointment request) async {
    final String urlString =
        "https://psychohelp-open.mybluemix.net/api/v1/appointment/${id}";
    Uri url = Uri.parse(urlString);

    var headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.put(url, headers: headers, body: jsonEncode(request));

    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      var appointment = Appointment.fromJson(json.decode(response.body));
      return appointment;
    } else
      return null;
  }

  Future<List> fetchAppointmentsByPatientId(int id) async {
    String urlString =
        'https://psychohelp.herokuapp.com/api/v1/appointment/patient/${id}';
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
}
