import 'dart:convert';
import 'package:buaacourse/models/comment.dart';
import 'package:buaacourse/models/course.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'comments.dart';

class CourseDetail extends StatelessWidget {
  final Course course;
  final Httpservice httpservice = Httpservice();

  CourseDetail({
    required this.course,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child:
                // Global.globalUser.userId == "" ?
                //       Column(
                //   children: <Widget>[
                //     ListTile(
                //       title: Text("Course"),
                //       subtitle: Text(course.courseName + "-" + course.courseId),
                //     ),
                //     ListTile(
                //       title: Text("Teacher"),
                //       subtitle: Text(course.courseTeacher + "-" + course.courseSchool),
                //     ),
                //     ListTile(
                //       title: Text("Property"),
                //       subtitle: Text(course.courseAttribute + "-" + course.courseType + "-" + course.courseLocation),
                //     ),
                //     ListTile(
                //       title: Text("Introduction"),
                //       subtitle: Text(course.courseIntroduction),
                //     ),
                //     ListTile(
                //       title: Text("Select/capacity"),
                //       subtitle: Text(course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                //     ),
                //   ],
                // ) :
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Course"),
                      subtitle: Text(course.courseName + "-" + course.courseId),
                    ),
                    ListTile(
                      title: Text("Teacher"),
                      subtitle: Text(course.courseTeacher + "-" + course.courseSchool),
                    ),
                    ListTile(
                      title: Text("Property"),
                      subtitle: Text(course.courseAttribute + "-" + course.courseType + "-" + course.courseLocation),
                    ),
                    ListTile(
                      title: Text("Introduction"),
                      subtitle: Text(course.courseIntroduction),
                    ),
                    ListTile(
                      title: Text("Select/capacity"),
                      subtitle: Text(course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                    ),
                    ListTile(
                      leading: TextButton.icon(
                        icon: Icon(Icons.article),
                        label: Text("评论"),
                        onPressed: (){},
                      ),
                      trailing: TextButton.icon(
                        icon: Icon(Icons.article),
                        label: Text("选课"),
                        onPressed: (){
                          _addCourse();
                        },
                      ),
                    ),
                  ],
                ) ,
              ),
              FutureBuilder(
                future: httpservice.getComments(course),
                  builder:(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasData){
                      List<Comment> comments = snapshot.data;

                      return ListView(
                        children: comments.map((Comment comment) => Card(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.assignment),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            title: Text("Comment Body"),
                            subtitle: Text(comment.body),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Comments(
                                    comment: comment,
                                  )),
                            ),
                          ),
                        )).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addCourse() async {
    var addCourseUrl = Global.baseUrl + "addCourse";

    var result = await post(Uri.parse(addCourseUrl),
            body: json.encode({
              "userId": Global.globalUser.userId,
              "courseId": course.courseId,
            }),
    );

    if (result.statusCode == 200) {
      if (json.decode(result.body)["success"]) {
        toast("选课成功！");
      } else {
        toast("出现了错误(ノへ￣、)");
      }
    } else {
      print(result.statusCode);
    }
  }
}

void toast(String string) {
  Fluttertoast.showToast(
      msg: string,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.red,
      fontSize: 16.0);
}
