import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

var leftRightPadding = 30.0;
var topBottomPadding = 4.0;
var textTips = const TextStyle(fontSize: 16.0, color: Colors.black);
var hintTips = const TextStyle(fontSize: 15.0, color: Colors.black26);
const LOGO = "assets/images/Login.jpg";

var _userPassController = TextEditingController();
var _userNameController = TextEditingController();

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _BuildAppBar(),
        body: _BuildBody(),
    );
  }
}

AppBar _BuildAppBar() {
  return AppBar(
    title: const Center(
      child: Text("欢迎使用BUAA-COURSE"),
    ),
  );
}

class _BuildBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
                leftRightPadding, 30.0, leftRightPadding, 10.0),
            child: Image.asset(LOGO),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
            child: TextField(
              style: hintTips,
              controller: _userNameController,
              decoration: const InputDecoration(hintText: "请输入学号"),
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
            child: TextField(
              style: hintTips,
              controller: _userPassController,
              decoration: const InputDecoration(hintText: "请输入用户密码"),
              obscureText: true,
            ),
          ),
          Container(
            width: 360.0,
            margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
            padding: EdgeInsets.fromLTRB(leftRightPadding,
                topBottomPadding, leftRightPadding, topBottomPadding),
            child: Card(
              color: Colors.blue,
              elevation: 6.0,
              child: FlatButton(
                  onPressed: () {
                    print("the pass is " + _userNameController.text);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '马上登录',
                      style:
                      TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  )),
            ),
          ),
          Container(
            width: 360.0,
            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            padding: EdgeInsets.fromLTRB(leftRightPadding,
                topBottomPadding, leftRightPadding, topBottomPadding),
            child: Card(
              color: Colors.blue,
              elevation: 6.0,
              child: FlatButton(
                  onPressed: () {
                    print("the password is " + _userPassController.text);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '没有账号？点击注册',
                      style:
                      TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

}