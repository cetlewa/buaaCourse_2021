import 'package:buaacourse/models/homenews.dart';
import 'package:buaacourse/screens/home/home_detail.dart';
import 'package:buaacourse/screens/home/home_http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  final Homehttp homehttp = Homehttp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: Padding(
      //       padding: const EdgeInsets.all(12.0),
      //       child: Column(
      //         children: <Widget>[
      //           Card(
      //             child: Column(
      //               children: <Widget>[
      //                 Image.asset("assets/images/Login.jpg"),
      //                 ListTile(
      //                   title: Text("balabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabala"),
      //                   subtitle: Text("Powered By Dua_Company-----2021/12/3"),
      //                   // onTap: () => Navigator.of(context).push(
      //                   //   MaterialPageRoute(
      //                   //       builder: (context) => HomeDetail(
      //                   //         homenews: ,
      //                   //       )),
      //                   // ),
      //                 ),
      //                 // Card(
      //                 //   color: Colors.red,
      //                 //   child: ListTile(
      //                 //     selected: true,
      //                 //     title: Text("Select/capacity"),
      //                 //     // trailing: Icon(Icons.keyboard_arrow_right),
      //                 //   ),
      //                 // ),
      //               ],
      //             ),
      //           ),
      //           Card(
      //             child: Column(
      //               children: <Widget>[
      //                 ListTile(
      //                   title: Text("Course"),
      //                   // subtitle: Text(course.courseName + "-" + course.courseId),
      //                 ),
      //                 ListTile(
      //                   title: Text("Teacher"),
      //                   // subtitle: Text(course.courseTeacher + "-" + course.courseSchool),
      //                 ),
      //                 ListTile(
      //                   title: Text("Property"),
      //                   // subtitle: Text(course.courseAttribute + "-" + course.courseType + "-" + course.courseLocation),
      //                 ),
      //                 ListTile(
      //                   title: Text("Introduction"),
      //                   // subtitle: Text(course.courseIntroduction),
      //                 ),
      //                 ListTile(
      //                   title: Text("Select/capacity"),
      //                   // subtitle: Text(course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Card(
      //             child: Column(
      //               children: <Widget>[
      //                 ListTile(
      //                   title: Text("Course"),
      //                   // subtitle: Text(course.courseName + "-" + course.courseId),
      //                 ),
      //                 ListTile(
      //                   title: Text("Teacher"),
      //                   // subtitle: Text(course.courseTeacher + "-" + course.courseSchool),
      //                 ),
      //                 ListTile(
      //                   title: Text("Property"),
      //                   // subtitle: Text(course.courseAttribute + "-" + course.courseType + "-" + course.courseLocation),
      //                 ),
      //                 ListTile(
      //                   title: Text("Introduction"),
      //                   // subtitle: Text(course.courseIntroduction),
      //                 ),
      //                 ListTile(
      //                   title: Text("Select/capacity"),
      //                   // subtitle: Text(course.courseSelected.toString() + "/" + course.courseCapacity.toString()),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       )
      //   ),
      // ),
      body: FutureBuilder(
        future: homehttp.getHomenews(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            List<Homenews> courses = snapshot.data;

            return ListView(
              children: courses.map((Homenews homenews) => Card(
                child: Column(
                  children: <Widget>[
                    Image.network(homenews.uri),
                    ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      title: Text(homenews.title),
                      subtitle: Text(homenews.author + "-" + homenews.time),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => HomeDetail(
                              homenews: homenews,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

}