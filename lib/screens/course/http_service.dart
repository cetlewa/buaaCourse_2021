import 'package:buaacourse/models/course.dart';
import 'package:http/http.dart';

import 'dart:convert';

class Httpservice {
  final String postsUrl = "http://127.0.0.1:5000/";

  Future<List<Course>> getCourses() async {
    Response response = await get(Uri.parse(postsUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Course> courses =
          body.map((dynamic item) => Course.fromJson(item)).toList();

      return courses;
    } else {
      throw "Can't get posts.";
    }
  }
}
