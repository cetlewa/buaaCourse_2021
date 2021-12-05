import 'package:buaacourse/models/user.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';
import 'package:http/http.dart';
import 'dart:convert';

class UserInfo extends StatefulWidget{
  final Httpservice httpservice = Httpservice();

  @override
  State<StatefulWidget> createState() => _UserInfo();
}

class _UserInfo extends State<UserInfo> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _schoolController = TextEditingController();
  TextEditingController _gradeController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  TextEditingController _mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Information"),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            User user = snapshot.data;
            _genderController.text = user.userGender;
            _schoolController.text = user.userSchool;
            _gradeController.text = user.userGrade;
            _locationController.text = user.userLocation;
            _telController.text = user.userTel;
            _mailController.text = user.userMail;

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/placeholder_avatar.png'),
                  ),
                  Text(user.userId + "-" + user.userName),
                  Row(
                    children: [
                      Text("您的性别"),
                      TextField(
                        controller: _genderController,

                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("您的性别"),
                      TextField(
                        controller: _genderController,

                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("您的性别"),
                      TextField(
                        controller: _genderController,

                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("您的性别"),
                      TextField(
                        controller: _genderController,

                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("您的性别"),
                      TextField(
                        controller: _genderController,

                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

}

class Httpservice {
  final String postsUrl = Global.baseUrl + "queryUserInfo";

  Future<User> getUserInfo() async {
    Response response = await post(
        Uri.parse(postsUrl),
        body: json.encode({
          "userId": Global.globalUser.userId,
        }),
    );

    if (response.statusCode == 200) {
    User user = User.fromJson(jsonDecode(response.body));

      return user;
    } else {
      throw "Can't get posts.";
    }
  }
}