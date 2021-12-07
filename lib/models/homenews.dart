class Homenews {
  final String uri;
  final String title;
  final String author;
  final String body;
  final String time;

  Homenews(
      this.uri,
      this.title,
      this.author,
      this.body,
      this.time,
      );

  Homenews.fromJson(Map<String, dynamic> json)
  : uri = json["uri"] == null ? "" : json["uri"],
    title = json["title"] == null ? "" : json["title"],
    author = json["author"] == null ? "" : json["author"],
    body = json["body"] == null ? "" : json["body"],
    time = json["time"] == null ? "" : json["time"];

  Map<String, dynamic> toJson() =>
    <String, dynamic>{
    "uri": uri,
    "title": title,
    "author": author,
    "body": body,
    "time": time,
  };
}