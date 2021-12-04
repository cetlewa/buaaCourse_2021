import 'package:buaacourse/models/homenews.dart';
import 'package:buaacourse/main.dart';
import 'package:http/http.dart';

import 'dart:convert';

class Homehttp {
  final String postsUrl = Global.baseUrl + "test";

  Future<List<Homenews>> getHomenews() async {
    Response response = await get(Uri.parse(postsUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Homenews> news =
      body.map((dynamic item) => Homenews.fromJson(item)).toList();

      return news;
    } else {
      throw "Can't get posts.";
    }
  }
}
