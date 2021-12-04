import 'package:buaacourse/models/user.dart';
import 'package:buaacourse/screens/home/home.dart';
import 'package:buaacourse/screens/login/login.dart';
import 'package:buaacourse/screens/login/register.dart';
import 'package:buaacourse/screens/my_course/myCourse.dart';
import 'package:buaacourse/screens/test/test.dart';
import 'package:buaacourse/screens/test/testUserInfo.dart';
import 'package:buaacourse/screens/user/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/constants.dart';
import 'package:buaacourse/screens/home/home_screen.dart';

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
      },
      // home: Login(),
      home: HomePage(),
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
