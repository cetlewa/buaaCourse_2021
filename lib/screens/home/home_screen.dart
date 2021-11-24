import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:buaacourse/constants.dart';

int _selectedIndex = 0;
// 创建数组引入页面
List pglist = [];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: kTextColor,
        type: BottomNavigationBarType.fixed,
        elevation: 5.0,
        unselectedFontSize: 12.0,
        selectedFontSize: 18.0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Find')),
          BottomNavigationBarItem(icon: Icon(null), title: Text('Cart')),
          BottomNavigationBarItem(icon: Icon(Icons.photo_filter), title: Text('Zone')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), title: Text('Ucenter')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _selectedIndex == 2 ? Colors.red : Colors.grey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add)
            ]
        ),
        onPressed: (){
          _selectedIndex = 2;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

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

  void _onItemTapped(int index) {
    _selectedIndex = index;
  }
}
