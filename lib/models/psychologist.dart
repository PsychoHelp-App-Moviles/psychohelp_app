import 'dart:convert';

Psychologist psychologistFromJson(String str) =>
    Psychologist.fromJson(json.decode(str));
String psychologistModelToJson(Psychologist data) => json.encode(data.toJson());

class Psychologist {
  int id;
  String name;
  String dni;
  String birthday;
  String email;
  String password;
  String phone;
  String specialization;
  String formation;
  String about;
  String gender;
  String sessionType;
  String img;
  String cmp;
  bool active;
  bool fresh;

  Psychologist({
    required this.id,
    required this.name,
    required this.dni,
    required this.birthday,
    required this.email,
    required this.password,
    required this.phone,
    required this.specialization,
    required this.formation,
    required this.about,
    required this.gender,
    required this.sessionType,
    required this.img,
    required this.cmp,
    required this.active,
    required this.fresh,
  });

  factory Psychologist.fromJson(Map<String, dynamic> json) {
    return Psychologist(
        id: json["id"],
        name: json["name"],
        dni: json["dni"],
        birthday: json["birthdayDate"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        specialization: json["specialization"],
        formation: json["formation"],
        about: json["about"],
        gender: json["genre"],
        sessionType: json["sessionType"],
        img: json["image"],
        cmp: json["cmp"],
        active: json["active"],
        fresh: json["fresh"]);
  }

  Map<String, dynamic> toJson() {
    return {
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
  }
}
