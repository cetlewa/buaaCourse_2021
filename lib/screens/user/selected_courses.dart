import 'package:buaacourse/models/course.dart';
import 'package:buaacourse/screens/user/selected_course_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../../main.dart';

class SelectedCourses extends StatelessWidget{
  final Httpservice httpservice = Httpservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("您已选择的课程"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "search_page");
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search)
            ]
        ),
      ),
      body: FutureBuilder(
        future: httpservice.getCourses(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            List<Course> courses = snapshot.data;

            return ListView(
              children: courses.map((Course course) => Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.assignment),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(course.courseName + "-" + course.courseId),
                  subtitle: Text(course.courseTeacher + "-" + course.coursePoint.toString()
                      + "-" + course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => SelectedCourseDetail(
                          course: course,
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
    );
  }
}

class Httpservice {
  final String postsUrl = Global.baseUrl + "";

  Future<List<Course>> getCourses() async {
    Response response = await post(
        Uri.parse(postsUrl),
        body: json.encode({
          "userId": Global.globalUser.userId,
        }),
    );

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

_postData() async{
  var apiUrl="https://jsonplaceholder.typicode.com/posts";

  var result = await post(Uri.parse(apiUrl), body: json.encode({"username": "cms", "gender": "c"}));
  if (result.statusCode == 201) {
    print(json.decode(result.body));
  }
  else {
    print(result.statusCode);
  }
}