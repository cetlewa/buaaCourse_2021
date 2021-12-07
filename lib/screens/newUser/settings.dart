import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';

class Settings extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() => _Settings();

}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("系统设置"),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: (){
            Global.globalUser.userId = "";
            Navigator.pushNamed(context, "home_screen_homePage");
          },
          child: Card(
            child: ListTile(
              title: Text("登出当前用户"),
            ),
          ),
        )
      ),
    );
  }

}