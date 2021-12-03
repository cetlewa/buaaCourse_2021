import 'package:flutter/material.dart';

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Course"),
                      // subtitle: Text(course.courseName + "-" + course.courseId),
                    ),
                    ListTile(
                      title: Text("Teacher"),
                      // subtitle: Text(course.courseTeacher + "-" + course.courseSchool),
                    ),
                    ListTile(
                      title: Text("Property"),
                      // subtitle: Text(course.courseAttribute + "-" + course.courseType + "-" + course.courseLocation),
                    ),
                    ListTile(
                      title: Text("Introduction"),
                      // subtitle: Text(course.courseIntroduction),
                    ),
                    ListTile(
                      title: Text("Select/capacity"),
                      // subtitle: Text(course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                    ),
                    ListTile(
                      leading: TextButton.icon(
                        icon: Icon(Icons.article),
                        label: Text("评论"),
                        onPressed: (){},
                      ),
                      trailing: TextButton.icon(
                        icon: Icon(Icons.article),
                        label: Text("选课"),
                        onPressed: (){},
                      ),
                    ),
                    // Card(
                    //   color: Colors.red,
                    //   child: ListTile(
                    //     selected: true,
                    //     title: Text("Select/capacity"),
                    //     // trailing: Icon(Icons.keyboard_arrow_right),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Course"),
                      // subtitle: Text(course.courseName + "-" + course.courseId),
                    ),
                    ListTile(
                      title: Text("Teacher"),
                      // subtitle: Text(course.courseTeacher + "-" + course.courseSchool),
                    ),
                    ListTile(
                      title: Text("Property"),
                      // subtitle: Text(course.courseAttribute + "-" + course.courseType + "-" + course.courseLocation),
                    ),
                    ListTile(
                      title: Text("Introduction"),
                      // subtitle: Text(course.courseIntroduction),
                    ),
                    ListTile(
                      title: Text("Select/capacity"),
                      // subtitle: Text(course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Course"),
                      // subtitle: Text(course.courseName + "-" + course.courseId),
                    ),
                    ListTile(
                      title: Text("Teacher"),
                      // subtitle: Text(course.courseTeacher + "-" + course.courseSchool),
                    ),
                    ListTile(
                      title: Text("Property"),
                      // subtitle: Text(course.courseAttribute + "-" + course.courseType + "-" + course.courseLocation),
                    ),
                    ListTile(
                      title: Text("Introduction"),
                      // subtitle: Text(course.courseIntroduction),
                    ),
                    ListTile(
                      title: Text("Select/capacity"),
                      // subtitle: Text(course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/Login.jpg",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}