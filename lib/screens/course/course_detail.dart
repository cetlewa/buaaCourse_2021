import 'dart:convert';
import 'package:buaacourse/models/course.dart';
import 'package:buaacourse/screens/test/test.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class CourseDetail extends StatefulWidget {
  final Course course;

  CourseDetail({
    required this.course,
});

  @override
  State<StatefulWidget> createState() => _CourseDetail(course: course, favorite: course.isStared);

}

class _CourseDetail extends State<CourseDetail> {
  final Course course;
  bool favorite;

  _CourseDetail({
    required this.course,
    this.favorite = true,
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
                        favorite ? Icons.favorite : Icons.favorite_border,
                        color: favorite ? Colors.red : null,
                      ),
                      onTap: () {
                        setState(() {
                          favorite = !favorite;
                          course.isStared = favorite;
                          _changeStar;
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
                        label: course.courseSelected < course.courseCapacity ?
                                Text("选课")  : Text("人数已满，暂不能选课"),
                        onPressed: (){
                          course.courseSelected < course.courseCapacity ?
                          _addCourse() : toast("该课程人数已满，暂不能选课，请联系教务老师呢~");
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

  void _changeStar() {
    _changeStarPost;
  }

  _changeStarPost() async {
    var changeStarUrl = Global.baseUrl + "starCourse";
    var result = await post(Uri.parse(changeStarUrl),
      body: json.encode({
        "userId": Global.globalUser.userId,
        "courseId": course.courseId,
        "isStared": course.isStared,
      }),
    );
  }

  _addCourse() async {
    var addCourseUrl = Global.baseUrl + "selectCourse";

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
        toast("再好的课程也不能选择两遍啊~");
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
