class Appointment {
  int id;
  String meetUrl;
  String motive;
  String personalHistory;
  String testRealized;
  String treatment;
  String scheduleDate;
  int patientId;
  int psychologistId;

  Appointment(
      {required this.id,
      required this.meetUrl,
      required this.motive,
      required this.personalHistory,
      required this.testRealized,
      required this.treatment,
      required this.scheduleDate,
      required this.patientId,
      required this.psychologistId});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
        id: json["id"],
        meetUrl: json["meetUrl"],
        motive: json["motive"],
        personalHistory: json["personalHistory"],
        testRealized: json["testRealized"],
        treatment: json["treatment"],
        scheduleDate: json["scheduleDate"],
        patientId: json["patientId"],
        psychologistId: json["psychologistId"]);
  }
}
