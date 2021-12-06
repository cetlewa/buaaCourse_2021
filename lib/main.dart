import 'package:buaacourse/models/user.dart';
import 'package:buaacourse/screens/comment/add_comment.dart';
import 'package:buaacourse/screens/comment/comment.dart';
import 'package:buaacourse/screens/course/search.dart';
import 'package:buaacourse/screens/course/search_result.dart';
import 'package:buaacourse/screens/login/login.dart';
import 'package:buaacourse/screens/login/register.dart';
import 'package:buaacourse/screens/newUser/user.dart';
import 'package:buaacourse/screens/recommended/recommended_course.dart';
import 'package:buaacourse/screens/user/add_score.dart';
import 'package:buaacourse/screens/user/change_password.dart';
import 'package:buaacourse/screens/user/my_comments.dart';
import 'package:buaacourse/screens/user/my_favorite.dart';
import 'package:buaacourse/screens/user/selected_courses.dart';
import 'package:buaacourse/screens/user/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/constants.dart';
import 'package:buaacourse/screens/home/home_screen.dart';

// class DarkModeProvider with ChangeNotifier {
//    /// 深色模式 0: 关闭 1: 开启 2: 随系统
//    late int _darkMode;
//    int get darkMode => _darkMode;
//    void changeMode(int darkMode) async {
//     _darkMode = darkMode;
//     notifyListeners();
//     SpUtil.putInt(SpConstant.DARK_MODE, darkMode);
//    }
//
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: []
    // );
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
        "selected_courses_page": (context) => SelectedCourses(),
        "my_comments_page": (context) => MyShowComment(),
        "my_favorite_page": (context) => MyFavorite(),
        "add_score_page": (context) => AddScore(),
        "change_password_page": (context) => ChangePwd(),
        "recommended_course": (context) => RecommendedCourse(),
        "new_user_page": (context) => NewUser(),
      },
      // home: HomePage(),
      // home: LoginPage(),
      home: NewUser(),
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
      "userSchool", "userGrade", "userLocation", "userTel", "userMail", "userType", 0.0);

  static String baseUrl = "https://service-dj0lsdex-1308473899.bj.apigw.tencentcs.com/release/";
}
