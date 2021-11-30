import 'package:buaacourse/screens/test/post_model.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({
    required this.post,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PostDetail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Title"),
                  subtitle: Text(post.title),
                ),
                ListTile(
                  title: Text("ID"),
                  subtitle: Text(post.id.toString()),
                ),
                ListTile(
                  title: Text("Body"),
                  subtitle: Text(post.body),
                ),
                ListTile(
                  title: Text("User ID"),
                  subtitle: Text(post.userId.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}