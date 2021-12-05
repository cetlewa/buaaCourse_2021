import 'package:buaacourse/models/user.dart';
import 'package:buaacourse/screens/comment/add_comment.dart';
import 'package:buaacourse/screens/comment/comment.dart';
import 'package:buaacourse/screens/course/search.dart';
import 'package:buaacourse/screens/course/search_result.dart';
import 'package:buaacourse/screens/home/home.dart';
import 'package:buaacourse/screens/login/login.dart';
import 'package:buaacourse/screens/login/register.dart';
import 'package:buaacourse/screens/test/testTextField.dart';
import 'package:buaacourse/screens/user/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/constants.dart';
import 'package:buaacourse/screens/home/home_screen.dart';

import 'newLogin/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'buaaCourse',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "login_page": (context) => Login(),
        "home_screen_homePage": (context) => HomePage(),
        "register_page": (context) => Register(),
        "userinfo_page": (context) => UserInfo(),
        "comments_page": (context) => ShowComment(),
        "add_comment": (context) => AddComments(),
        "search_page": (context) => Search(),
        "search_result_page": (context) => SearchResult(),
      },
      home: HomePage(),
      // home: LoginPage(),
      // home: TestText(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class Global {
  static User globalUser = User("", "userName", "userPwd", "userGender",
      "userSchool", "userGrade", "userLocation", "userTel", "userMail");

  static String baseUrl = "https://service-dj0lsdex-1308473899.bj.apigw.tencentcs.com/release/";
}
