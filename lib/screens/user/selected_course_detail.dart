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
                        title: Text("Course/Score"),
                        subtitle: course.score == -1 ?
                        Text(course.courseName + "-" + course.courseId) :
                        Text(course.courseName + "-" + course.courseId + "-" + course.score.toString()) ,
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
                      title: Text("Course/Score"),
                      subtitle: course.score == -1 ?
                      Text(course.courseName + "-" + course.courseId) :
                      Text(course.courseName + "-" + course.courseId + "-" + course.score.toString()) ,
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
              Text("学生成绩分布图", style: TextStyle(fontSize: 20.0),),
              Padding(
                padding: EdgeInsets.all(10),
                child: ColumnChart(
                  data: [double.parse(course.cosLess60.toString()),
                    double.parse(course.cos60to70.toString()),
                    double.parse(course.cos70to80.toString()),
                    double.parse(course.cos80to90.toString()),
                    double.parse(course.cos90to100.toString())],
                  xAxis: ['<60', '60~70', '70~80', '80~90', '>90'],
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
