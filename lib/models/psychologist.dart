class Psychologist {
  int id;
  String name;
  String dni;
  String email;
  DateTime birthday;
  String phone;
  String password;
  String specialization;
  String formation;
  String date;
  String gender;
  String img;
  String cmp;
  String sessionType;
  String about;
  bool active;
  bool fresh;

  Psychologist({
    required this.id,
    required this.name,
    required this.dni,
    required this.email,
    required this.birthday,
    required this.phone,
    required this.password,
    required this.specialization,
    required this.formation,
    required this.date,
    required this.gender,
    required this.img,
    required this.cmp,
    required this.sessionType,
    required this.about,
    required this.active,
    required this.fresh,
  });

  factory Psychologist.fromJson(Map<String, dynamic> json) {
    return Psychologist(
        id: json["id"],
        name: json["name"],
        dni: json["dni"],
        email: json["email"],
        birthday: DateTime.parse(json["birthdayDate"]),
        phone: json["phone"],
        password: json["password"],
        specialization: json["specialization"],
        formation: json["formation"],
        date: json["date"],
        gender: json["gender"],
        img: json["image"],
        cmp: json["cmp"],
        sessionType: json["sessionType"],
        about: json["about"],
        active: json["active"],
        fresh: json["fresh"]);
  }
}
