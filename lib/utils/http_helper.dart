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

  Future<Psychologist> fetchPsychologistById(int id) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/psychologists/${id}';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      Psychologist psycho = Psychologist.fromJson(jsonResponse);
      return psycho;
    } else {
      throw Exception('Failed to load psycho');
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
      List appointments =
          jsonResponse.map((map) => Appointment.fromJson(map)).toList();
      return appointments;
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

  Future<List> fetchAppointmentsByPsychologistAndPatientId(
      int patientId, int psychoId) async {
    String urlString =
        'https://psychohelp-open.mybluemix.net/api/v1/appointment/psychologist/${psychoId}/patient/${patientId}';
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

    if (response.statusCode == HttpStatus.ok) {
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

  Future updatePsychologist(int id, Psychologist request) async {
    final String urlString =
        "https://psychohelp-open.mybluemix.net/api/v1/psychologists/${id}";
    Uri url = Uri.parse(urlString);

    var headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.put(url, headers: headers, body: jsonEncode(request));

    if (response.statusCode == HttpStatus.ok) {
      var psychologist = Psychologist.fromJson(json.decode(response.body));
      return psychologist;
    } else
      return null;
  }

  Future updatePatient(int id, Patient request) async {
    final String urlString =
        "https://psychohelp-open.mybluemix.net/api/v1/patients/${id}";
    Uri url = Uri.parse(urlString);

    var headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.put(url, headers: headers, body: jsonEncode(request));

    if (response.statusCode == HttpStatus.ok) {
      var patient = Patient.fromJson(json.decode(response.body));
      return patient;
    } else
      return null;
  }

  Future deletePublication(int id) async {
    final String urlString =
        "https://psychohelp-open.mybluemix.net/api/v1/publications/${id}";
    Uri url = Uri.parse(urlString);

    final response = await http.delete(url);

    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else
      return false;
  }

  Future<Psychologist?> createPsychologist(
    int id,
    String name,
    String dni,
    String birthday,
    String email,
    String password,
    String phone,
    String specialization,
    String formation,
    String about,
    String gender,
    String sessionType,
    String img,
    String cmp,
    bool active,
    bool fresh,
  ) async {
    final String urlString =
        "https://psychohelp-open.mybluemix.net/api/v1/psychologists";
    Uri url = Uri.parse(urlString);

    final body = {
      "id": id,
      "name": name,
      "dni": dni,
      "birthdayDate": birthday,
      "email": email,
      "password": password,
      "phone": phone,
      "specialization": specialization,
      "formation": formation,
      "about": about,
      "genre": gender,
      "sessionType": sessionType,
      "image": img,
      "cmp": cmp,
      "active": active,
      "fresh": fresh,
    };
    print(body);
    var headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == HttpStatus.ok) {
      final String responseString = response.body;
      print('Psycho creado');
      return psychologistFromJson(responseString);
    } else
      return null;
  }

  Future<Patient?> createPatient(
    int id,
    String firstName,
    String lastName,
    String email,
    String password,
    String date,
    String phone,
    String gender,
    String img,
  ) async {
    final String urlString =
        "https://psychohelp-open.mybluemix.net/api/v1/patients";
    Uri url = Uri.parse(urlString);

    final body = {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "password": password,
      "date": date,
      "gender": gender,
      "img": img,
    };

    print(body);
    var headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == HttpStatus.ok) {
      final String responseString = response.body;
      print('Paciente creado');
      return patientFromJson(responseString);
    } else
      return null;
  }

  Future<Appointment?> createAppointment(
    Appointment request,
    int patientId,
    int psychologistId,
  ) async {
    final String urlString =
        "https://psychohelp-open.mybluemix.net/api/v1/appointment/patient/${patientId}/psychologist/${psychologistId}";
    Uri url = Uri.parse(urlString);

    var headers = {
      'Content-Type': 'application/json',
    };

    final body = {
      "meetUrl": request.meetUrl,
      "motive": request.motive,
      "personalHistory": request.personalHistory,
      "testRealized": request.testRealized,
      "treatment": request.treatment,
      "scheduleDate": request.scheduleDate
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == HttpStatus.ok) {
      final String responseString = response.body;
      print('Cita creada');
      return appointmentFromJson(responseString);
    } else
      return null;
  }
}
