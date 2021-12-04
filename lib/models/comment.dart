class Comment {
  final String body;

  Comment(
      this.body
  );

  Comment.fromJson(Map<String, dynamic> json)
  : body = json["body"];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        "body": body,
      };
}