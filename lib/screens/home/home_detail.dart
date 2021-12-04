import 'package:buaacourse/models/homenews.dart';
import 'package:flutter/material.dart';

class HomeDetail extends StatelessWidget {
  final Homenews homenews;

  const HomeDetail({
    required this.homenews,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeDetail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                Image.network(homenews.uri),
                ListTile(
                  title: Text("Title"),
                  subtitle: Text(homenews.title),
                ),
                ListTile(
                  title: Text("Author-Time"),
                  subtitle: Text(homenews.author + "-" + homenews.time),
                ),
                ListTile(
                  title: Text("Body"),
                  subtitle: Text(homenews.body),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}