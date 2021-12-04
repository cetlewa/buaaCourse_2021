import 'package:buaacourse/models/comment.dart';
import 'package:buaacourse/models/course.dart';
import 'package:buaacourse/screens/course/comments.dart';
import 'package:flutter/material.dart';

class ShowComment extends StatelessWidget{
  final Httpservice httpservice = Httpservice();

  @override
  Widget build(BuildContext context) {
    String course = (ModalRoute.of(context)!.settings.arguments).toString();
    return Scaffold(
      body: FutureBuilder(
        future: httpservice.getComments(course),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            List<Comment> comments = snapshot.data;

            return ListView(
              children: comments.map((Comment comment) => Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.assignment),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(comment.userName),
                  subtitle: Text(comment.commentText),
                  // onTap: () => Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => CourseDetail(
                  //         course: course,
                  //       )),
                  // ),
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