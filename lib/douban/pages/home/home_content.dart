import 'package:demo/douban/service/api/home/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/home_model.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<MoviceItem> movies = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    dynamic result = await getHomeData();
    if (kDebugMode) {
      print(result);
    }
    setState(() {
      movies.addAll(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (ctx, index) {
              return Image.network(movies[index].cover_url);
            }));
  }
}
