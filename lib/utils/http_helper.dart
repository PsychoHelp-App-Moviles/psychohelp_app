import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/models/patient.dart';

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

  Future<List> fetchPatientAppointments(int id) async {
    String urlString = 'https://psychohelp-open.mybluemix.net/api/v1/appointment/patient/${id}';
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
}
