import 'dart:convert';
import 'package:buaacourse/models/course.dart';
import 'package:buaacourse/screens/test/test.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class SelectedCourseDetail extends StatefulWidget {
  final Course course;

  SelectedCourseDetail({
    required this.course,
  });

  @override
  State<StatefulWidget> createState() => _SelectedCourseDetail(course: course);

}

class _SelectedCourseDetail extends State<SelectedCourseDetail> {
  final Course course;

  _SelectedCourseDetail({
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
                Global.globalUser.userId == "" ?
                Column(
                  children: <Widget>[
                    ListTile(
                        title: Text("Course"),
                        subtitle: Text(course.courseName + "-" + course.courseId),
                        trailing: Icon(Icons.favorite_border)
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
                ) :
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Course"),
                      subtitle: Text(course.courseName + "-" + course.courseId),
                      trailing: Icon(
                        course.isStared ? Icons.favorite : Icons.favorite_border,
                        color: course.isStared ? Colors.red : null,
                      ),
                      onTap: () {
                        setState(() {
                          course.isStared = !course.isStared;
                        });
                      },
                      // trailing: Icon(Icons.favorite_border),
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
                        onPressed: (){
                          Navigator.of(context).pushNamed("comments_page", arguments: course.courseId);
                        },
                      ),
                      trailing: TextButton.icon(
                        icon: Icon(Icons.article),
                        label: Text("退课"),
                        onPressed: (){
                          _subCourse();
                        },
                      ),
                    ),
                  ],
                ) ,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ColumnChart(
                  data: [180.0, 98.0, 126.0, 64.0, 118.0],
                  xAxis: ['一月', '二月', '三月', '四月', '五月'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _subCourse() async {
    var addCourseUrl = Global.baseUrl + "dropCourse";

    var result = await post(Uri.parse(addCourseUrl),
      body: json.encode({
        "userId": Global.globalUser.userId,
        "courseId": course.courseId,
      }),
    );

    if (result.statusCode == 200) {
      if (json.decode(result.body)["success"]) {
        toast("退课成功，期待下次相遇");
      } else {
        toast("再不好的课程也不能退两遍啊~");
      }
    } else {
      toast("出现了错误(ノへ￣、)");
      print(Global.globalUser.userId);
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
