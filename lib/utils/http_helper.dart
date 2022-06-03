import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/pages/patient/appointments.dart';

class HttpHelper {
  Future<List> fetchPublications() async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/publications';
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

  Future<List> fetchAppointmentsByPsychologistId(int id) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/appointment/psychologist/${id}';
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

  Future<List> fetchAppointmentsByPatientId(int id) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/appointment/patient/${id}';
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

  Future<List> fetchPublicationByPsychoId(int id) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/publications/psychologist/${id}';
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

  Future<Publication?> createPublication(String title, String tags,
      String description, String photoUrl, String content, int id) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/publications/psychologist/${id}';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.post(url, body: {
      "title": title,
      "tags": tags,
      "description": description,
      "photoUrl": photoUrl,
      "content": content,
    });

    if (response.statusCode == 201) {
      final String responseString = response.body;
      return Publication.fromJson(json.decode(responseString));
    }
    return null;
  }
}
