import 'package:buaacourse/main.dart';
import 'package:buaacourse/screens/login/login.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            MeHeader(),
            SizedBox(height: 10, ),
            buildCells(context),
          ],
        ),
      ),
    );
  }

  Widget buildCells(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            child: Column(
              children: [
                Container(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    title: Text("列表1"),
                    // iconName: "img/me_buy.png",
                    // onPressed: () {},
                  ),
                ),
                Container(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    title: Text("列表2"),
                    // iconName: "img/me_feedback.png",
                    // onPressed: () {},
                  ),
                ),
                Container(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    title: Text("列表3"),
                    // iconName: "img/me_coupon.png",
                    // onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Card(
            child: Container(
              color: Colors.lightBlueAccent,
              child: ListTile(
                title: Text("列表4"),
                // iconName: "img/me_date.png",
                // onPressed: () {},
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Card(
            child: Container(
              color: Colors.lightBlueAccent,
              child: ListTile(
                title: Text("列表5"),
                // iconName: "img/me_action.png",
                // onPressed: () {},
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Card(
            child: Column(
              children: [
                Container(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    title: Text("设置"),
                    // iconName: "img/me_setting.png",
                    // onPressed: () {
                    // },
                  ),
                ),
                Container(
                  color: Colors.lightBlueAccent,
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
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 30, 15, 15),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/placeholder_avatar.png'),
                ),
                SizedBox(width: 25),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Global.globalUser.userId == "000" ?
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