import 'package:buaacourse/screens/test/post_model.dart';
import 'package:http/http.dart';

import 'dart:convert';

class Httpservice {
  final String postsUrl = "http://127.0.0.1:5000/";

  Future<List<Post>> getCourses() async{
    Response response = await get(Uri.parse(postsUrl));

    if(response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    }
    else {
      throw "Can't get posts.";
    }
  }
}