import 'package:buaacourse/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../../main.dart';

class MyShowComment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyShowComment();

}

class _MyShowComment extends State<MyShowComment>{
  final Httpservice httpservice = Httpservice();

  @override
  Widget build(BuildContext context) {
    String courseId = (ModalRoute.of(context)!.settings.arguments).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("这是您的足迹"),
      ),
      body: FutureBuilder(
        future: httpservice.getComments(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            List<Comment> comments = snapshot.data;

            return ListView(
              children: comments.map((Comment comment) => Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.comment),
                  ),
                  trailing: Text(comment.commentScore),
                  title: Text(comment.commentText),
                ),
              )).toList(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Httpservice {
  final String postsUrl = Global.baseUrl + "queryMyComment";

  Future<List<Comment>> getComments() async {
    print("get comments begin");
    Response response = await post(
      Uri.parse(postsUrl),
      body: json.encode({
        "userId": Global.globalUser.userId,
      }),
    );

    print(response.statusCode);
    print(response.body.toString());

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