class Psychologist {
  int id;
  String name;
  String dni;
  DateTime birthdayDate;
  String email;
  String password;
  String specialization;
  String formation;
  String about;
  String genre;
  String sessionType;
  String image;
  String cmp;
  bool active;
  bool fresh;

  Psychologist(
      {required this.id,
      required this.name,
      required this.dni,
      required this.birthdayDate,
      required this.email,
      required this.password,
      required this.specialization,
      required this.formation,
      required this.about,
      required this.genre,
      required this.sessionType,
      required this.image,
      required this.cmp,
      required this.active,
      required this.fresh});

  factory Psychologist.fromJson(Map<String, dynamic> json) {
    return Psychologist(
        id: json["id"],
        name: json["name"],
        dni: json["dni"],
        birthdayDate: DateTime.parse(json["birthdayDate"]),
        email: json["email"],
        password: json["password"],
        specialization: json["specialization"],
        formation: json["formation"],
        about: json["about"],
        genre: json["genre"],
        sessionType: json["sessionType"],
        image: json["image"],
        cmp: json["cmp"],
        active: json["active"],
        fresh: json["fresh"]);
  }
}
