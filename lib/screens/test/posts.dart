import 'package:buaacourse/screens/test/http_service.dart';
import 'package:buaacourse/screens/test/post_detail.dart';
import 'package:buaacourse/screens/test/post_model.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  final Httpservice httpservice = Httpservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpservice.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;

            return ListView(
              children: posts!
                  .map((Post post) => ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.id.toString()),
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
