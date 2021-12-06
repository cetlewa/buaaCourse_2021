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
  final String userType;
  final double userGPA;

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
      this.userType,
      this.userGPA,
      );

  User.fromJson(Map<String, dynamic> json)
      : userId = json["userId"]==null ? "": json["userId"],
        userName = json["userName"]==null ? "": json["userName"],
        userPwd = json["userPwd"]==null ? "": json["userPwd"],
        userGender = json["userGender"]==null ? "": json["userGender"],
        userSchool = json["userSchool"]==null ? "": json["userSchool"],
        userGrade = json["userGrade"]==null ? "": json["userGrade"],
        userLocation = json["userLocation"]==null ? "": json["userLocation"],
        userTel = json["userTel"]==null ? "": json["userTel"],
        userType = json["userType"]==null ? "": json["userType"],
        userGPA = json["userGPA"]==null ? 0.0 : json["userGPA"],
        userMail = json["userMail"]==null ? "": json["userMail"];

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
        "userGPA": userGPA,
        "userType": userType,
      };
}
