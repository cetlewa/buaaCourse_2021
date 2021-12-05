import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../../main.dart';

class ChangePwd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChangePwd();

}

class _ChangePwd extends State<ChangePwd> {
  TextEditingController _oldPwd = TextEditingController();
  TextEditingController _newPwd1 = TextEditingController();
  TextEditingController _newPwd2 = TextEditingController();
  bool isShowPassWord1 = false;
  bool isShowPassWord2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Course"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text("请输入您原来的密码"),
                    subtitle: TextField(
                      controller: _oldPwd,
                    ),
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: _newPwd1,
                    decoration: InputDecoration(
                        labelText: '请输入一遍新的密码',
                        labelStyle: const TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 93, 93, 93)),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isShowPassWord1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 126, 126, 126),
                          ),
                          onPressed: showPassWord1,
                        )),
                    obscureText: !isShowPassWord1,
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: _newPwd2,
                    decoration: InputDecoration(
                        labelText: '请再输入一遍新的密码',
                        labelStyle: const TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 93, 93, 93)),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isShowPassWord2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 126, 126, 126),
                          ),
                          onPressed: showPassWord2,
                        )),
                    obscureText: !isShowPassWord2,
                  ),
                ),
                Container(
                  height: 45.0,
                  margin: EdgeInsets.only(top: 10.0),
                  child: SizedBox.expand(
                    child: RaisedButton(
                      onPressed: changePwdPost,
                      color: Colors.blue,
                      child: const Text(
                        '提交',
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
            )
        ),
      ),
    );
  }

  void showPassWord2() {
    setState(() {
      isShowPassWord2 = !isShowPassWord2;
    });
  }

  void showPassWord1() {
    setState(() {
      isShowPassWord1 = !isShowPassWord1;
    });
  }

  void changePwdPost() {
    if(_newPwd1.text == _newPwd2.text) {
      _changePwdPost;
    }
    else {
      toast("您两次输入的密码不一致，请检查！");
    }
  }

  _changePwdPost() async {
    var loginUrl = Global.baseUrl + "changePwd";

    var result = await post(Uri.parse(loginUrl),
        body: json.encode({
          "userId": Global.globalUser.userId,
          "userPwd": _newPwd1.text,
        }));
    if (result.statusCode == 200) {
      Navigator.pushNamed(context, "login_page");
    } else {
      print(result.statusCode);
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

}