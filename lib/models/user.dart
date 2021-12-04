class User {
  String userId;
  final String userName;
  final String userPwd;
  final String userGender;
  final String userSchool;
  final String userGrade;
  final String userLocation;
  final String userTel;
  final String userMail;

  User(
      this.userId,
      this.userName,
      this.userPwd,
      this.userGender,
      this.userSchool,
      this.userGrade,
      this.userLocation,
      this.userTel,
      this.userMail,
      );

  User.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        userName = json["userName"],
        userPwd = json["userPwd"],
        userGender = json["userGender"],
        userSchool = json["userSchool"],
        userGrade = json["userGrade"],
        userLocation = json["userLocation"],
        userTel = json["userTel"],
        userMail = json["userMail"];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        "userId": userId,
        "userName": userName,
        "userPwd": userPwd,
        "userGender": userGender,
        "userSchool": userSchool,
        "userGrade": userGrade,
        "userLocation": userLocation,
        "userTel": userTel,
        "userMail": userMail,
      };
}
