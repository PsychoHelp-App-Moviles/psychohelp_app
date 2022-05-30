class Publication {
  int id;
  String title;
  String description;
  String photoUrl;

  Publication({
    required this.id,
    required this.title,
    required this.description,
    required this.photoUrl,
  });

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      photoUrl: json["photoUrl"],
    );
  }
}
