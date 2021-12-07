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
      backgroundColor: Color(0xFFE7E9EC),
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