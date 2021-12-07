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

  String _controller = "";
  String _genderController = "";
  String _schoolController = "";
  String _gradeController = "";
  String _locationController = "";
  String _telController = "";
  String _mailController = "";
  String temp = "\$\$\$";

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
            _genderController = user.userGender=="" ? "未填写" : user.userGender;
            _schoolController = user.userSchool=="" ? "未填写" : user.userSchool;
            _gradeController = user.userGrade=="" ? "未填写" : user.userGrade;
            _locationController = user.userLocation=="" ? "未填写" : user.userLocation;
            _telController = user.userTel=="" ? "未填写" : user.userTel;
            _mailController = user.userMail=="" ? "未填写" : user.userMail;

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
                  Card(
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: ListTile(
                            title: Text("您的GPA: " + user.userGPA.toString(), style: TextStyle(fontSize: 20.0),),
                          ),
                        ),
                        GestureDetector(
                          child: Card(
                            child: ListTile(
                              trailing: Text(_genderController + ">", style: TextStyle(color: Colors.grey),
                              ),
                              title: Text("您的性别:"),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushNamed("change_info_page",
                                arguments: "1" + temp + _genderController + temp + _schoolController +
                            temp + _gradeController + temp + _locationController + temp +
                            _telController + temp + _mailController);
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            child: ListTile(
                              trailing: Text(_telController + ">", style: TextStyle(color: Colors.grey),
                              ),
                              title: Text("您的电话:"),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushNamed("change_info_page",
                                arguments: "5" + temp + _genderController + temp + _schoolController +
                                    temp + _gradeController + temp + _locationController + temp +
                                    _telController + temp + _mailController);
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            child: ListTile(
                              trailing: Text(_mailController + ">", style: TextStyle(color: Colors.grey),
                              ),
                              title: Text("您的邮箱:"),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushNamed("change_info_page",
                                arguments: "6" + temp + _genderController + temp + _schoolController +
                                    temp + _gradeController + temp + _locationController + temp +
                                    _telController + temp + _mailController);
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            child: ListTile(
                              trailing: Text(_schoolController + ">", style: TextStyle(color: Colors.grey),
                              ),
                              title: Text("您的院系:"),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushNamed("change_info_page",
                                arguments: "2" + temp + _genderController + temp + _schoolController +
                                    temp + _gradeController + temp + _locationController + temp +
                                    _telController + temp + _mailController);
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            child: ListTile(
                              trailing: Text(_gradeController + ">", style: TextStyle(color: Colors.grey),
                              ),
                              title: Text("您的年级:"),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushNamed("change_info_page",
                                arguments: "3" + temp + _genderController + temp + _schoolController +
                                    temp + _gradeController + temp + _locationController + temp +
                                    _telController + temp + _mailController);
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            child: ListTile(
                              trailing: Text(_locationController + ">", style: TextStyle(color: Colors.grey),
                              ),
                              title: Text("您所在的校区:"),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushNamed("change_info_page",
                                arguments: "4" + temp + _genderController + temp + _schoolController +
                                    temp + _gradeController + temp + _locationController + temp +
                                    _telController + temp + _mailController);
                          },
                        ),
                        // Container(
                        //   height: 45.0,
                        //   margin: EdgeInsets.only(top: 40.0),
                        //   child: SizedBox.expand(
                        //     child: RaisedButton(
                        //       onPressed: changeUserInfo,
                        //       color: const Color.fromARGB(255, 61, 182, 203),
                        //       child: const Text(
                        //         '修改信息',
                        //         style: TextStyle(
                        //             fontSize: 14.0,
                        //             color: Color.fromARGB(255, 255, 255, 255)),
                        //       ),
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(45.0)),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
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
      "userGender": _genderController,
      "userSchool": _schoolController,
      "userGrade": _gradeController,
      "userLocation": _locationController,
      "userTel": _telController,
      "userMail": _mailController,
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