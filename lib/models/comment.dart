class Comment {
  final String userId;
  final String userName;
  final String commentScore;
  final String commentText;

  Comment(
      this.userId,
      this.userName,
      this.commentScore,
      this.commentText,
  );

  Comment.fromJson(Map<String, dynamic> json)
  : userId = json["userId"]==null ? "" : json["userId"],
    userName = json["userName"] == null ? "" : json["userName"],
    commentScore = json["commentScore"]==null ? "" : json["commentScore"],
    commentText = json["commentText"]==null ? "" : json["commentText"];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        "userId": userId,
        "userName": userName,
        "commentScore": commentScore,
        "commentText": commentText,
      };
}