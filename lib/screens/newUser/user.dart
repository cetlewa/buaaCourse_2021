import 'package:buaacourse/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewUser extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _User();

}

class _User extends State<NewUser> {
  double midText = 10.0;
  double midIcon = 25.0;
  double topCard = 130.0;
  // double midText = 175.0;
  // double midIcon = 193.0;
  // double topCard = 15.0;

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width1 =size.width;
    final height1 =size.height;
    final widthc = width1/57*13;
    final spacew = width1/57;
    double left1 = spacew;
    double left2 = 2*spacew + widthc;

    return Scaffold(
      backgroundColor: Color(0xFFE7E9EC),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            // ListTile(
            //   leading: CircleAvatar(
            //     radius: 40,
            //     backgroundImage: AssetImage('assets/images/placeholder_avatar.png'),
            //   ),
            //   title: Text("UserName"),
            //   subtitle: Text("UserInfo"),
            // ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 0.0,
              child: Image.asset("assets/images/Login.jpg"),
            ),
            Positioned(
              top: 150.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Card(
                color: Color(0xFFE7E9EC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Stack(
                  alignment:Alignment.center ,
                  children: <Widget>[
                    Positioned(
                      left: 13.0,
                      right: 13.0,
                      top: topCard,
                      height: 130.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          ),
                          child: Center(
                            child: ListTile(
                              trailing: Icon(Icons.keyboard_arrow_right),
                              title: Text("您的课程",style: TextStyle(fontSize: 20.0),),
                              subtitle: Text("统计了您已选修过的课程"),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pushNamed("selected_courses_page");
                        },
                      ),
                    ),
                    Positioned(
                      left: left1,
                      top: midText,
                      width: 84.0,
                      height: 110.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment(0, 0.45),
                              child: Text("我的收藏", style: TextStyle(fontSize: 15.0),),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pushNamed("my_favorite_page");
                        },
                      ),
                    ),
                    Positioned(
                      left: left2,
                      top: midText,
                      width: 84.0,
                      height: 110.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment(0, 0.45),
                              child: Text("我的评论", style: TextStyle(fontSize: 15.0),),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pushNamed("my_comments_page");
                        },
                      )
                    ),
                    Positioned(
                      right: left2,
                      top: midText,
                      width: 84.0,
                      height: 110.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment(0, 0.45),
                              child: Text("修改密码", style: TextStyle(fontSize: 15.0),),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, "change_password_page");
                        },
                      ),
                    ),
                    Positioned(
                      right: left1,
                      top: midText,
                      width: 84.0,
                      height: 110.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment(0, 0.45),
                              child: Text("系统设置", style: TextStyle(fontSize: 15.0),),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pushNamed("settings_page");
                        },
                      ),
                    ),
                    Positioned(
                      left: width1/57*4.3,
                      top: midIcon,
                      child: GestureDetector(
                        child: Icon(Icons.favorite, color: Colors.red, size: 37,),
                        onTap: (){
                          Navigator.of(context).pushNamed("my_favorite_page");
                        },
                      ),
                    ),
                    Positioned(
                      left: width1/57*18.5,
                      top: midIcon,
                      child: GestureDetector(
                        child: Icon(Icons.comment, color: Colors.lightBlueAccent, size: 37,),
                        onTap: (){
                          Navigator.of(context).pushNamed("my_comments_page");
                        },
                      ),

                    ),
                    Positioned(
                      right: width1/57*18.5,
                      top: midIcon,
                      child: GestureDetector(
                        child: Icon(Icons.portrait, color: Color(0xF5BFA337), size: 37,),
                        onTap: (){
                          Navigator.of(context).pushNamed("change_password_page");
                        },
                      ),

                    ),
                    Positioned(
                      right: width1/57*4.3,
                      top: midIcon,
                      child: GestureDetector(
                        child: Icon(Icons.settings, color: Color(0xF5808080), size: 37,),
                        onTap: (){
                          Navigator.of(context).pushNamed("settings_page");
                        },
                      ),
                    ),
                    Positioned(
                      left: 13.0,
                      right: 13.0,
                      top: 280.0,
                      height: 180.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          ),
                          child: Center(
                            child: ListTile(
                              trailing: Icon(Icons.keyboard_arrow_right),
                              title: Text("智能推荐课程",style: TextStyle(fontSize: 20.0),),
                              subtitle: Text("基于NLP情感分析所给出的结果，绝对是您的不二之选"),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, "recommended_course");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 40,
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundColor: Color(0xFFFAAE62),
                radius: 40,
                backgroundImage: AssetImage('assets/images/placeholder_avatar.png'),
              ),
            ),
            Positioned(
              top: 75,
              left: 120,
              child: GestureDetector(
                child: Global.globalUser.userId == "" ?
                Text("点击登录",
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ) :
                Text("19373529",
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
                onTap: (){
                  if(Global.globalUser.userId == "") {
                    Navigator.pushNamed(context, "login_page");
                  }
                },
              ),
            ),
            Positioned(
              top: 75.0,
              right: 20,
              child: GestureDetector(
                child: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 37,),
                onTap: (){
                  if(Global.globalUser.userId == ""){
                    Navigator.pushNamed(context, "login_page");
                  }
                  else{
                    Navigator.pushNamed(context, "userinfo_page");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
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

}