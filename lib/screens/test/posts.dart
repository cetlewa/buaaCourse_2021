import 'dart:convert';

import 'package:buaacourse/screens/test/http_service.dart';
import 'package:buaacourse/screens/test/post_detail.dart';
import 'package:buaacourse/screens/test/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostsPage extends StatelessWidget {
  final Httpservice httpservice = Httpservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _postData();
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add)
            ]
        ),
      ),
      body: FutureBuilder(
        future: httpservice.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;

            return ListView(
              children: posts!
                  .map((Post post) => ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.assignment),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        title: Text(post.title),
                        subtitle: Text(post.id.toString()),
                        enabled: post.id > 5 ? false : true,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => PostDetail(
                                    post: post,
                                  )),
                        ),
                      ))
                  .toList(),
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

_postData() async{
  var apiUrl="http://127.0.0.1:5000/login";

  var result = await post(Uri.parse(apiUrl), body: {'username': '蔡明生', 'gender': '女'});
  if (result.statusCode == 200) {
    print(json.decode(result.body));
  }
  else {
    print(result.statusCode);
  }
}
