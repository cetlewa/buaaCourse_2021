import 'package:buaacourse/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewUser extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _User();

}

class _User extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
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
                      top: 15.0,
                      height: 150.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        ),
                        child: Center(
                          child: ListTile(
                            trailing: Icon(Icons.keyboard_arrow_right),
                            title: Text("您的课程",style: TextStyle(fontSize: 20.0),),
                            subtitle: Text("GPA"),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 13.0,
                      top: 175.0,
                      width: 84.0,
                      height: 110.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment(0, 0.5),
                              child: Text("我的收藏", style: TextStyle(fontSize: 15.0),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 110.0,
                      top: 175.0,
                      width: 84.0,
                      height: 110.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: Text("sssss", style: TextStyle(fontSize: 20.0),),
                          ),
                        ),
                        onTap: (){},
                      )
                    ),
                    Positioned(
                      right: 110.0,
                      top: 175.0,
                      width: 84.0,
                      height: 110.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: Text("sssss", style: TextStyle(fontSize: 20.0),),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 13.0,
                      top: 175.0,
                      width: 84.0,
                      height: 110.0,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: Text("sssss", style: TextStyle(fontSize: 20.0),),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 37.0,
                      top: 180.0,
                      child: Icon(Icons.favorite, color: Colors.red, size: 35,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}