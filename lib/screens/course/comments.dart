import 'package:buaacourse/models/comment.dart';
import 'package:buaacourse/models/course.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:buaacourse/main.dart';

import 'dart:convert';

class Comments extends StatelessWidget {
  final Comment comment;

  const Comments({
    required this.comment,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Comment User"),
              subtitle: Text(comment.userName),
            ),
            ListTile(
              title: Text("Comment Text"),
              subtitle: Text(comment.commentText),
            ),
          ],
        ),
      ),
    );
  }
}

class Httpservice {
  final String postsUrl = Global.baseUrl + "queryComment";

  Future<List<Comment>> getComments(Course course) async {
    Response response = await post(
        Uri.parse(postsUrl),
        body: json.encode({
          "courseId": course.courseId,
        }),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Comment> comments =
      body.map((dynamic item) => Comment.fromJson(item)).toList();

      return comments;
    } else {
      throw "Can't get posts.";
    }
  }
}
