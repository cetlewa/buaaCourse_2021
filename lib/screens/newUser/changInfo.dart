import 'package:buaacourse/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';

String userGender = "";
String userSchool = "";
String userGrade = "";
String userLocation = "";
String userTel = "";
String userMail= "";
int index = 0;

class ChangeInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChangeInfo();

}

class _ChangeInfo extends State<ChangeInfo>{
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)!.settings.arguments;
    print(args.toString());
    index = int.parse(args.toString().split("\$\$\$")[0]);
    userGender = args.toString().split("\$\$\$")[1];
    userSchool = args.toString().split("\$\$\$")[2];
    userGrade = args.toString().split("\$\$\$")[3];
    userLocation = args.toString().split("\$\$\$")[4];
    userTel = args.toString().split("\$\$\$")[5];
    userMail = args.toString().split("\$\$\$")[6];
    print(index);
    print(userGender);
    print(userSchool);
    print(userGrade);
    print(userLocation);
    print(userTel);
    print(userMail);

    return Scaffold(
      appBar: AppBar(
        title: Text("输入新的信息"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              Card(
                child: TextField(
                  controller: _searchController,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 93, 93, 93)),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 126, 126, 126),
                      ),
                      onPressed: () {
                        _searchController.text = "";
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 45.0,
                margin: EdgeInsets.only(top: 20.0),
                child: SizedBox.expand(
                  child: RaisedButton(
                    onPressed: _searchCourse,
                    color: Colors.blue,
                    child: const Text(
                      "提交修改",
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
        ),
      ),
    );
  }

  void _searchCourse() {
    if(index == 1) {
      userGender = _searchController.text;
    }
    else if(index == 2) {
      userSchool = _searchController.text;
    }
    else if(index == 3) {
      userGrade = _searchController.text;
    }
    else if(index == 4) {
      userLocation = _searchController.text;
    }
    else if(index == 5) {
      userTel = _searchController.text;
    }
    else if(index == 6) {
      userMail = _searchController.text;
    }
    _changeInfo();
  }

  _changeInfo() async {
    var changeUrl = Global.baseUrl + "changeUserInfo";

    print(index);
    print(userGender);
    print(userSchool);
    print(userGrade);
    print(userLocation);
    print(userTel);
    print(userMail);

    var response = await post(
      Uri.parse(changeUrl),
      body: json.encode({
        "userId": Global.globalUser.userId,
        "userGender": userGender,
        "userSchool": userSchool,
        "userGrade": userGrade,
        "userLocation": userLocation,
        "userTel": userTel,
        "userMail": userMail,
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