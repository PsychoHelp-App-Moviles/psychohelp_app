import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/models/psychologist.dart';
//import 'package:psychohelp_app/pages/patient/appointments.dart';

class HttpHelper {
  Future<List> fetchPatients() async {
    String urlString = 'https://psychohelp-open.mybluemix.net/api/v1/patients';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List patients = jsonResponse.map((map) => Patient.fromJson(map)).toList();
      return patients;
    }

    return [];
  }

  Future<Patient> fetchByPatientEmail(String email) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/patients/email/${email}';
    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      Patient patient = Patient.fromJson(jsonResponse);
      return patient;
    } else {
      throw Exception('Failed to load Patient');
    }
  }

  Future<Psychologist> fetchByPsychologistEmail(String email) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/psychologists/email/${email}';
    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      Psychologist psychologist = Psychologist.fromJson(jsonResponse);
      return psychologist;
    } else {
      throw Exception('Failed to load Psychologist');
    }
  }

  Future<List> fetchPsychologist() async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/psychologists';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List psychologists =
          jsonResponse.map((map) => Psychologist.fromJson(map)).toList();
      return psychologists;
    }

    return [];
  }

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

  Future<Patient> fetchPatientById(int id) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/patients/${id}';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      Patient patient = Patient.fromJson(jsonResponse);
      return patient;
    } else {
      throw Exception('Failed to load patient');
    }
  }

  Future<http.Response> deleteAppointmentById(int id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://psychohelp-open.mybluemix.net/api/v1/appointment/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
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

  Future<List> fetchPatientAppointments(int id) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/appointment/patient/${id}';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List patients = jsonResponse.map((map) => Patient.fromJson(map)).toList();
      return patients;
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
    final String urlString =
        "https://psychohelp-open.mybluemix.net/api/v1/publications/psychologists/${id}";
    Uri url = Uri.parse(urlString);

    final body = {
      "title": title,
      "tags": tags,
      "description": description,
      "photoUrl": photoUrl,
      "content": content,
    };

    var headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    print(response.body);

    if (response.statusCode == 201) {
      final String responseString = response.body;
      return publicationFromJson(responseString);
    } else
      return null;
  }

  Future fetchPublicationById(int id) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/publications/${id}';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      Publication publication = Publication.fromJson(jsonResponse);
      return publication;
    }
    return null;
  }

  Future updatePublication(int id, Publication request) async {
    final String urlString =
        "https://psychohelp-open.mybluemix.net/api/v1/publications/${id}";
    Uri url = Uri.parse(urlString);

    var headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.put(url, headers: headers, body: jsonEncode(request));

    if (response.statusCode == HttpStatus.ok) {
      var publication = Publication.fromJson(json.decode(response.body));
      return publication;
    } else
      return null;
  }
}
