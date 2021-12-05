import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AddScore extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddScore();

}

class _AddScore extends State<AddScore>{
  TextEditingController _courseId = TextEditingController();
  TextEditingController _score = TextEditingController();

  void addScore() {
    _addScore();
  }

  _addScore() async{
    var addScoreUrl = Global.baseUrl + "addCourseGrade";

    print(_courseId.text);
    print(int.parse(_score.text));
    var response = await post(
      Uri.parse(addScoreUrl),
      body: json.encode({
        "userId": Global.globalUser.userId,
        "courseId": _courseId.text,
        "score": int.parse(_score.text),
      }),
    );

    if(response.statusCode == 200){
      Navigator.pushNamed(context, "home_screen_homePage");
    }
    else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Course"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text("您想要添加成绩的课程的课程号"),
                  subtitle: TextField(
                    controller: _courseId,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("您这门课程的成绩"),
                  subtitle: TextField(
                    controller: _score,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              Container(
                height: 45.0,
                margin: EdgeInsets.only(top: 10.0),
                child: SizedBox.expand(
                  child: RaisedButton(
                    onPressed: addScore,
                    color: Colors.blue,
                    child: const Text(
                      '提交',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0)),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

}