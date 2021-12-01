import 'package:buaacourse/models/course.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final Course course;

  const CourseDetail({
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
          child: Card(
            child: Column(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

}