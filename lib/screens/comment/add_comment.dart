import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:buaacourse/screens/comment/star/spon_rating_widget.dart';

String _courseId = "";
TextEditingController _controller = TextEditingController();

class AddComments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddComment();

}

class AddComment extends State<AddComments>{

  String ratingValue = "9" ;

  void _addPost(){
    _addPostComment();
  }

  _addPostComment() async {
    var loginUrl = Global.baseUrl + "addCourseComment";
    var nlpUrl = "http://maxseason.cn/validate?text='" + _controller.text + "'";
    int isRecom = 0;

    print("Coming into NLP");

    var nlpResult = await post(
      Uri.parse(nlpUrl),
      body: json.encode({
        "commentText": _controller.text,
      }),
    );

    print(nlpResult.body.toString());
    print("NLP Ending");

    if(nlpResult.body == "recommended") {
      isRecom = 1;
    }

    var result = await post(Uri.parse(loginUrl),
        body: json.encode({
          "userId": Global.globalUser.userId,
          "courseId": _courseId,
          "commentText": _controller.text,
          "commentScore": ratingValue.toString(),
          "isRecom": isRecom,
        }));
    if (result.statusCode == 200) {
      if (json.decode(result.body)["success"]) {
        toast("提交成功(*^▽^*)");
        Navigator.pop(context, _courseId);
      } else {
        toast("提交失败呢~");
      }
    } else {
      print(result.statusCode);
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

  String value() {
    if(ratingValue == null) {
      return '评分：9 分';
    }else {
      return '评分：$ratingValue  分';
    }
  }

  @override
  Widget build(BuildContext context) {
    _courseId = (ModalRoute.of(context)!.settings.arguments).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("欢迎留下您的评论"),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30,),
                      Row(
                        children: <Widget>[
                          Expanded(child: Container(),),
                          SponRatingWidget(
                            value: 9,
                            size: 30,
                            padding: 5,
                            nomalImage: 'assets/images/star_nomal.png',
                            selectImage: 'assets/images/star.png',
                            selectAble: true,
                            onRatingUpdate: (value) {
                              ratingValue = value;
                              setState(() {

                              });
                            },
                            maxRating: 10,
                            count: 6,
                          ),
                          Expanded(child: Container(),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(value())
                    ],
                  ),
                ),
                Card(
                  child: TextField(
                    controller: _controller,
                    maxLines: 5,
                    textInputAction: TextInputAction.send,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: '有什么想说的咩~\no(*￣︶￣*)o',
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 93, 93, 93)),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 126, 126, 126),
                        ),
                        onPressed: () {
                          _controller.text = "";
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45.0,
                  margin: EdgeInsets.only(top: 20.0),
                  child: SizedBox.expand(
                    child: RaisedButton(
                      onPressed: _addPost,
                      color: const Color.fromARGB(255, 61, 182, 203),
                      child: const Text(
                        '提交评论',
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
            ),
          ),
        ),
    );
  }
}
