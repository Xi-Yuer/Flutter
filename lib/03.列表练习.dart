import 'package:flutter/material.dart';

main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("标题"),
        ),
      ),
      body: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Item("Apple", "苹果手机",
            "https://koko-img-oss.oss-cn-chengdu.aliyuncs.com/3152985137c6cdf93de6bb58db9a270f.jpeg"),
        Item("HuaWei", "华为手机",
            "https://koko-img-oss.oss-cn-chengdu.aliyuncs.com/3152985137c6cdf93de6bb58db9a270f.jpeg"),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final String title;
  final String desc;
  final String imgUrl;

  const Item(this.title, this.desc, this.imgUrl, {Key? key}) : super(key: key);

  static const style = TextStyle(fontSize: 30, color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16), // 设置内边距
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
        width: 5, // 设置边框的宽度
        color: Colors.purple, // 设置边框的颜色
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 列的对其方式
        children: [
          Column(
            children: [
              Text(title, style: style),
              const SizedBox(height: 8), // 垂直间距
              Text(desc),
              Image.network(imgUrl)
            ],
          )
        ],
      ),
    );
  }
}
