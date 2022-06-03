class Publication {
  int id;
  String title;
  String tags;
  String description;
  String photoUrl;
  String content;

  Publication({
    required this.id,
    required this.title,
    required this.tags,
    required this.description,
    required this.photoUrl,
    required this.content,
  });

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      id: json["id"],
      title: json["title"],
      tags: json["tags"],
      description: json["description"],
      photoUrl: json["photoUrl"],
      content: json["content"],
    );
  }
}
