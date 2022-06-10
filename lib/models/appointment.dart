import 'dart:convert';

Appointment employerFromJson(String str) =>
    Appointment.fromJson(json.decode(str));

String employerToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  int id;
  String meetUrl;
  String motive;
  String personalHistory;
  String testRealized;
  String treatment;
  String scheduleDate;

  Appointment(
      {required this.id,
      required this.meetUrl,
      required this.motive,
      required this.personalHistory,
      required this.testRealized,
      required this.treatment,
      required this.scheduleDate});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json["id"],
      meetUrl: json["meetUrl"],
      motive: json["motive"],
      personalHistory: json["personalHistory"],
      testRealized: json["testRealized"],
      treatment: json["treatment"],
      scheduleDate: json["scheduleDate"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "meetUrl": meetUrl,
        "motive": motive,
        "personalHistory": personalHistory,
        "testRealized": testRealized,
        "treatment": treatment,
        "scheduleDate": scheduleDate,
      };
}
