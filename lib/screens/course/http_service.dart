import 'package:buaacourse/models/course.dart';
import 'package:http/http.dart';
import 'package:buaacourse/main.dart';

import 'dart:convert';

class Httpservice {
  final String postsUrl = Global.baseUrl + "queryAllCourse";

  Future<List<Course>> getCourses() async {
    Response response = await post(
        Uri.parse(postsUrl),
        body: json.encode({
          "userId": Global.globalUser.userId,
        }),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      print(response.body);

      List<Course> courses =
          body.map((dynamic item) => Course.fromJson(item)).toList();

      return courses;
    } else {
      throw "Can't get posts.";
    }
  }
}
