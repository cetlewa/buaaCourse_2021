import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:buaacourse/main.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> _loginKey = new GlobalKey<FormState>();
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  bool isShowPassWord = false;

  void checkLoginInfo() {
    //验证Form表单
    if ((_loginKey.currentState as FormState).validate()) {
      if (_userIdController.text == "") {
        toast("没有看见您的学号呢o(￣ヘ￣o＃)");
      } else if (_passWordController.text == "") {
        toast("没有检测到您的密码呢o(一︿一+)o");
      } else {
        //验证通过提交数据
        _checkUserInfo();
        print('userId: ' + _userIdController.text +
            ' password: ' + _passWordController.text);
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

  _checkUserInfo() async {
    var loginUrl =
        "https://service-dj0lsdex-1308473899.bj.apigw.tencentcs.com/release/login";

    var result = await post(Uri.parse(loginUrl),
        body: json.encode({
          "userId": "${_userIdController.text}",
          "userPwd": "${_passWordController.text}"
        }));
    if (result.statusCode == 200) {
      if (json.decode(result.body)["success"]) {
        Global.globalUser.userId = "${_userIdController.text}";
        toast("欢迎使用(*^▽^*)");
        Navigator.pushNamed(context, "home_screen_homePage");
      } else {
        toast("账号密码出错了呢~");
      }
    } else {
      print(result.statusCode);
    }
  }

  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form表单示例',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 100.0, bottom: 10.0),
                child: const Text(
                  'LOGO',
                  style: TextStyle(
                      color: Color.fromARGB(255, 53, 53, 53), fontSize: 50.0),
                )),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _loginKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0))),
                      child: TextFormField(
                        controller: _userIdController,
                        decoration: InputDecoration(
                          labelText: '请输入学号',
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
                              _userIdController.text = "";
                            },
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        // validator: (v) {
                        //   return v!.trim().length > 0 ? null : "用户名不能为空";
                        // },
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0))),
                      child: TextFormField(
                        controller: _passWordController,
                        decoration: InputDecoration(
                            labelText: '请输入密码',
                            labelStyle: const TextStyle(
                                fontSize: 15.0,
                                color: Color.fromARGB(255, 93, 93, 93)),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                isShowPassWord
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color.fromARGB(255, 126, 126, 126),
                              ),
                              onPressed: showPassWord,
                            )),
                        obscureText: !isShowPassWord,
                      ),
                    ),
                    Container(
                      height: 45.0,
                      margin: EdgeInsets.only(top: 40.0),
                      child: SizedBox.expand(
                        child: RaisedButton(
                          onPressed: checkLoginInfo,
                          color: const Color.fromARGB(255, 61, 182, 203),
                          child: const Text(
                            '登录',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45.0)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: RaisedButton(
                              onPressed: router2Register,
                              color: const Color.fromARGB(255, 61, 182, 203),
                              child: const Text(
                                '注册账号',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color.fromARGB(255, 53, 53, 53)),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45.0)),
                            ),
                          ),
                          RaisedButton(
                            onPressed: router2Register,
                            color: const Color.fromARGB(255, 61, 182, 203),
                            child: const Text(
                              '忘记密码？',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Color.fromARGB(255, 53, 53, 53)),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45.0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void router2Register() {
    Navigator.pushNamed(context, "register_page");
  }
}
