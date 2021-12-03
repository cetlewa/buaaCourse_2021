import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  GlobalKey<FormState> _registerKey = new GlobalKey<FormState>();
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passWordController1 = TextEditingController();
  TextEditingController _passWordController2 = TextEditingController();
  TextEditingController _userTelController = TextEditingController();
  TextEditingController _userSchoolController = TextEditingController();
  bool isShowPassWord1 = false;
  bool isShowPassWord2 = false;

  void post4Register () {
    if((_registerKey.currentState as FormState).validate()){
      if(_userIdController.text == ""){
        toast("没有看见您的学号呢o(￣ヘ￣o＃)");
      }
      else if(_userNameController.text == ""){
        toast("别害羞嘛，让我看看你的名字o(￣ヘ￣o＃)");
      }
      else if(_passWordController1.text == "" ||
          _passWordController2.text == "" ||
          _passWordController1.text != _passWordController2.text){
        toast("您的密码输入出错啦o(一︿一+)o");
      }
      else if(_userTelController.text == ""){
        toast("没有看见您的电话呢o(￣ヘ￣o＃)");
      }
      else if(_userTelController.text.length != 11){
        toast("请输入正确的电话号码o(￣ヘ￣o＃)");
      }
      else if(_userSchoolController.text == ""){
        toast("没有看见您的学院呢o(￣ヘ￣o＃)");
      }
      else{
        _postData();
      }
    }
  }

  _postData() async {
    var loginUrl="https://jsonplaceholder.typicode.com/posts";

    var result = await post(
        Uri.parse(loginUrl),
        body: utf8.encode(json.encode(
            {
              "userId": "${_userIdController.text}",
              "userPwd": "${_passWordController1.text}",
              "userName": "${_userNameController.text}",
              "userTel": "${_userTelController.text}",
              "userSchool": "${_userSchoolController.text}"
            })
        )
    );
    if (result.statusCode == 200) {
      if(json.decode(result.body)["success"]){
        Navigator.pushNamed(context, "home_screen_homePage");
      }
    }
    else {
      toast("当前学号已被注册！");
      print(result.statusCode);
    }
  }

  void toast (String string){
    Fluttertoast.showToast(
        msg: string,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "注册表单",
      home: Scaffold(
        appBar: AppBar(
          title: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pushNamed(context, "login_page");
              }
          ),
        ),
        // drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                  child: const Text(
                    'LOGO',
                    style: TextStyle(
                        color: Color.fromARGB(255, 53, 53, 53),
                        fontSize: 50.0
                    ),
                  )
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _registerKey,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 240, 240, 240),
                                    width: 1.0
                                )
                            )
                        ),
                        child: TextField(
                          controller: _userIdController,
                          decoration: InputDecoration(
                            labelText: '请输入您的学号',
                            labelStyle: TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
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
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 240, 240, 240),
                                    width: 1.0
                                )
                            )
                        ),
                        child: TextField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                            labelText: '请输入您的姓名',
                            labelStyle: TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 126, 126, 126),
                              ),
                              onPressed: () {
                                _userNameController.text = "";
                              },
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 240, 240, 240),
                                    width: 1.0
                                )
                            )
                        ),
                        child: TextFormField(
                          controller: _passWordController1,
                          decoration:  InputDecoration(
                              labelText: '请输入您的登录密码',
                              labelStyle: const TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isShowPassWord1 ? Icons.visibility : Icons.visibility_off,
                                  color: const Color.fromARGB(255, 126, 126, 126),
                                ),
                                onPressed: (){
                                  setState(() {
                                    isShowPassWord1 = !isShowPassWord1;
                                  });
                                },
                              )
                          ),
                          obscureText: !isShowPassWord1,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 240, 240, 240),
                                    width: 1.0
                                )
                            )
                        ),
                        child: TextFormField(
                          controller: _passWordController2,
                          decoration:  InputDecoration(
                              labelText: '请再重复输入一次您的密码',
                              labelStyle: const TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isShowPassWord2 ? Icons.visibility : Icons.visibility_off,
                                  color: const Color.fromARGB(255, 126, 126, 126),
                                ),
                                onPressed: (){
                                  setState(() {
                                    isShowPassWord2 = !isShowPassWord2;
                                  });
                                },
                              )
                          ),
                          obscureText: !isShowPassWord2,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 240, 240, 240),
                                    width: 1.0
                                )
                            )
                        ),
                        child: TextField(
                          controller: _userTelController,
                          decoration: InputDecoration(
                            labelText: '请输入您的电话',
                            labelStyle: TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 126, 126, 126),
                              ),
                              onPressed: () {
                                _userTelController.text = "";
                              },
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 240, 240, 240),
                                    width: 1.0
                                )
                            )
                        ),
                        child: TextField(
                          controller: _userSchoolController,
                          decoration: InputDecoration(
                            labelText: '请输入您的学院',
                            labelStyle: TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 126, 126, 126),
                              ),
                              onPressed: () {
                                _userSchoolController.text = "";
                              },
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        height: 45.0,
                        margin: EdgeInsets.only(top: 40.0),
                        child: SizedBox.expand(
                          child: RaisedButton(
                            onPressed: post4Register,
                            color: const Color.fromARGB(255, 61, 182, 203),
                            child: const Text(
                              '马上注册',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 255, 255, 255)
                              ),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
