import 'package:buaacourse/models/user.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';

class UserInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _UserInfo();
}

class _UserInfo extends State<UserInfo> {
  final Httpservice httpservice = Httpservice();

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
        future: httpservice.getUserInfo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            User user = snapshot.data;
            _genderController.text = user.userGender=="" ? "您还没有填写此信息" : user.userGender;
            _schoolController.text = user.userSchool=="" ? "您还没有填写此信息" : user.userSchool;
            _gradeController.text = user.userGrade=="" ? "您还没有填写此信息" : user.userGrade;
            _locationController.text = user.userLocation=="" ? "您还没有填写此信息" : user.userLocation;
            _telController.text = user.userTel=="" ? "您还没有填写此信息" : user.userTel;
            _mailController.text = user.userMail=="" ? "您还没有填写此信息" : user.userMail;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/placeholder_avatar.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Text(
                          user.userId + "-" + user.userName,
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("您的性别:"),
                        subtitle: TextField(
                          controller: _genderController,

                        ),
                      ),
                      ListTile(
                        title: Text("您的电话"),
                        subtitle: TextField(
                          controller: _telController,

                        ),
                      ),
                      ListTile(
                        title: Text("您的邮箱"),
                        subtitle: TextField(
                          controller: _mailController,

                        ),
                      ),
                      ListTile(
                        title: Text("您的院系"),
                        subtitle: TextField(
                          controller: _schoolController,

                        ),
                      ),
                      ListTile(
                        title: Text("您的年级"),
                        subtitle: TextField(
                          controller: _gradeController,

                        ),
                      ),
                      ListTile(
                        title: Text("您所在的校区"),
                        subtitle: TextField(
                          controller: _locationController,
                        ),
                      ),
                      Container(
                        height: 45.0,
                        margin: EdgeInsets.only(top: 40.0),
                        child: SizedBox.expand(
                          child: RaisedButton(
                            onPressed: changeUserInfo,
                            color: const Color.fromARGB(255, 61, 182, 203),
                            child: const Text(
                              '修改信息',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          print("debug");
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void changeUserInfo() {
    _changeUserInfo();
  }

  _changeUserInfo() async {
    var changeUrl = Global.baseUrl + "changeUserInfo";

    var response = await post(
      Uri.parse(changeUrl),
      body: json.encode({
      "userId": Global.globalUser.userId,
      "userGender": _genderController.text,
      "userSchool": _schoolController.text,
      "userGrade": _gradeController.text,
      "userLocation": _locationController.text,
      "userTel": _telController.text,
      "userMail": _mailController.text,
      }),
    );

    if (response.statusCode == 200) {
      print("修改成功！");
      toast("修改成功！");
      Navigator.pushNamed(context, "home_screen_homePage");
    }
    else {
      print(response.statusCode);
      toast("发生了未知错误");
    }
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
      print(response.body);
    User user = User.fromJson(jsonDecode(response.body));
    print(response.body);

      return user;
    } else {
      print(response.statusCode.toString());
      throw "Can't get posts.";
    }
  }
}

void toast(String string) {
  Fluttertoast.showToast(
      msg: string,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.red,
      fontSize: 16.0);
}