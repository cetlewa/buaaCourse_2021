import 'package:buaacourse/main.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xF281F8F8),
        child: ListView(
          children: <Widget>[
            MeHeader(),
            SizedBox(height: 5,),
            buildCells(context),
          ],
        ),
      ),
    );
  }

  Widget buildCells(BuildContext context) {
    return Container(
      child:
              Global.globalUser.userId == "" ?
              Column(
                children: <Widget>[
                  Card(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: ListTile(
                            title: Text("设置"),
                            // iconName: "img/me_setting.png",
                            // onPressed: () {
                            // },
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: ListTile(
                            title: Text("About"),
                            // iconName: 'img/me_feedback.png',
                            // onPressed: () {
                            // },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ) :
              Column(
        children: <Widget>[
          Card(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
            child: Column(
              children: [
                GestureDetector(
                  child: Card(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("个人信息"),
                        // iconName: "img/me_buy.png",
                        // onPressed: () {},
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, "userinfo_page");
                  },
                ),
                Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text("已选课程"),
                      // iconName: "img/me_feedback.png",
                      // onPressed: () {},
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text("我的收藏"),
                      // iconName: "img/me_coupon.png",
                      // onPressed: () {},
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text("我的评论"),
                      // iconName: "img/me_date.png",
                      // onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.0),
          // SizedBox(height: 4.0),
          // Card(
          //   child: Container(
          //     color: Colors.white,
          //     child: ListTile(
          //       title: Text("列表5"),
          //       // iconName: "img/me_action.png",
          //       // onPressed: () {},
          //     ),
          //   ),
          // ),
          // SizedBox(height: 2.0),
          Card(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Card(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: ListTile(
                      title: Text("没有想好"),
                      // iconName: "img/me_action.png",
                      // onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Card(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: ListTile(
                      title: Text("设置"),
                      // iconName: "img/me_setting.png",
                      // onPressed: () {
                      // },
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Card(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: ListTile(
                      title: Text("About"),
                      // iconName: 'img/me_feedback.png',
                      // onPressed: () {
                      // },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var user = UserManager.currentUser;

    return GestureDetector(
        onTap: () {
        },
        child: Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 30, 15, 15),
            child: Row(
              children: <Widget>[
                Container(
                  child: GestureDetector(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/placeholder_avatar.png'),
                    ),
                    onTap: (){
                      if (Global.globalUser.userId == "") {
                        Navigator.pushNamed(context, "login_page");
                      }
                    },
                  ),
                ),
                SizedBox(width: 25),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Global.globalUser.userId == "" ?
                      Container(
                        child: GestureDetector(
                          child: Text(
                            '登录',
                            style: TextStyle(fontSize: 18),
                          ),
                          onTap: (){
                            Navigator.pushNamed(context, "login_page");
                          },
                        ),
                  )
                          : Text(Global.globalUser.userId) ,
                      // SizedBox(height: 10),
                      // buildItems(),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}