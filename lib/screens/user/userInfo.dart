import 'package:buaacourse/models/user.dart';
import 'package:flutter/material.dart';
import 'package:buaacourse/main.dart';
import 'package:http/http.dart';
import 'dart:convert';

class UserInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _UserInfo();
}

class _UserInfo extends State<UserInfo> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Information"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/placeholder_avatar.png'),
              ),
            ),
            Text("UserName"),

          ],
        ),
      ),
    );
  }

}

// class Httpservice {
//   final String postsUrl = Global.baseUrl + "";
//
//   User getUserInfo() async {
//     Response response = await post(
//         Uri.parse(postsUrl),
//         body: json.encode({
//           "userId": Global.globalUser.userId,
//         }),
//     );
//
//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);
//
//       List<User> courses =
//       body.map((dynamic item) => Course.fromJson(item)).toList();
//
//       return courses;
//     } else {
//       throw "Can't get posts.";
//     }
//   }
// }