import 'package:buaacourse/main.dart';
import 'package:buaacourse/screens/course/courses.dart';
import 'package:buaacourse/screens/home/home.dart';
import 'package:buaacourse/screens/my_course/myCourse.dart';
import 'package:buaacourse/screens/newUser/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:buaacourse/constants.dart';

//底部的索引
int _selectedIndex = 0;
// 创建数组引入页面
List pageList = [Home(),Courses(),SyllabusPage(),NewUser()];

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex != 3 ? buildAppBar() : null ,
      bottomNavigationBar: buildBottomNavigationBar(),
      body: pageList[_selectedIndex],
    );
  }

  //顶部AppBar
  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: _selectedIndex == 0 ? Text("首页资讯", style: TextStyle(color: Colors.black),) :
              _selectedIndex == 1 ? Text("课程列表", style: TextStyle(color: Colors.black),) :
              _selectedIndex == 2 ? Text("我的课表", style: TextStyle(color: Colors.black),) : null ,
      iconTheme: IconThemeData(
        color: Colors.black, //修改颜色
      ),
      backgroundColor: Color(0xFFE7E9EC),
      // backgroundColor: Color(0xD7000000),
      elevation: 0,
      // leading: IconButton(
      //   icon: SvgPicture.asset("assets/icons/back.svg"),
      //   onPressed: () {},
      // ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("search_page");
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }

  //底部导航栏
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      fixedColor: kTextColor,
      type: BottomNavigationBarType.fixed,
      elevation: 5.0,
      unselectedFontSize: 12.0,
      selectedFontSize: 18.0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.wysiwyg_outlined), label: '课程列表'),
        BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in_outlined), label: '我的课表'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: '我'),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index){
        setState(() {
          _selectedIndex = index;
          // if(_selectedIndex == 3){
          //   Navigator.pushNamed(context, "new_user_page");
          // }
        });
      },
      // onTap: _onItemTapped,
    );
  }

  //定义的功能按钮
  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: _selectedIndex == 2 ? Colors.red : Colors.grey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add)
          ]
      ),
      onPressed: (){
        _selectedIndex = 2;
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      },
    );
  }
}
