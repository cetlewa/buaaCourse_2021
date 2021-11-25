import 'package:buaacourse/screens/home/course.dart';
import 'package:buaacourse/screens/home/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:buaacourse/constants.dart';

//底部的索引
int _selectedIndex = 2;
// 创建数组引入页面
List pageList = [User(),Course(),User(),User(),User()];

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pageList[_selectedIndex],
    );
  }

  //顶部AppBar
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Find'),
        BottomNavigationBarItem(icon: Icon(null), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.photo_filter), label: 'Zone'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Ucenter'),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index){
        setState(() {
          _selectedIndex = index;
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
        // Fluttertoast.showToast(
        //     msg: "This is Center Short Toast",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );
        _selectedIndex = 2;
      },
    );
  }
}
