import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/images/Login.jpg"),
                      ListTile(
                        title: Text("balabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabala"),
                        subtitle: Text("Powered By Dua_Company-----2021/12/3"),
                      ),
                      // Card(
                      //   color: Colors.red,
                      //   child: ListTile(
                      //     selected: true,
                      //     title: Text("Select/capacity"),
                      //     // trailing: Icon(Icons.keyboard_arrow_right),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Course"),
                        // subtitle: Text(course.courseName + "-" + course.courseId),
                      ),
                      ListTile(
                        title: Text("Teacher"),
                        // subtitle: Text(course.courseTeacher + "-" + course.courseSchool),
                      ),
                      ListTile(
                        title: Text("Property"),
                        // subtitle: Text(course.courseAttribute + "-" + course.courseType + "-" + course.courseLocation),
                      ),
                      ListTile(
                        title: Text("Introduction"),
                        // subtitle: Text(course.courseIntroduction),
                      ),
                      ListTile(
                        title: Text("Select/capacity"),
                        // subtitle: Text(course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Course"),
                        // subtitle: Text(course.courseName + "-" + course.courseId),
                      ),
                      ListTile(
                        title: Text("Teacher"),
                        // subtitle: Text(course.courseTeacher + "-" + course.courseSchool),
                      ),
                      ListTile(
                        title: Text("Property"),
                        // subtitle: Text(course.courseAttribute + "-" + course.courseType + "-" + course.courseLocation),
                      ),
                      ListTile(
                        title: Text("Introduction"),
                        // subtitle: Text(course.courseIntroduction),
                      ),
                      ListTile(
                        title: Text("Select/capacity"),
                        // subtitle: Text(course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

}