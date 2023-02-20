import 'package:demo/douban/model/home_model.dart';
import 'package:demo/douban/service/request/request.dart';
import 'package:flutter/foundation.dart';

Future getHomeData() async {
  Map<String, dynamic> result = await Instance.get("/home");
  final moviceItem = result["data"]["items"];

  List<MoviceItem> movies = [];

  for (var item in moviceItem) {
    movies.add(MoviceItem.fromJson(item));
  }
  return movies;
}
