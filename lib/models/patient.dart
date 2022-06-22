import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));
String patientModelToJson(Patient data) => json.encode(data.toJson());

class Patient {
  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
  String date;
  String gender;
  String img;

  Patient(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.password,
      required this.date,
      required this.gender,
      required this.img});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        date: json["date"],
        gender: json["gender"],
        img: json["img"]);
  }

  Map<String, dynamic> toJson() {
    return {
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
  }
}
