import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final String message;

  const DetailPage(this.message,{Key? key }) : super(key: key);

  void _backToHome(context) {
    Navigator.of(context).pop("返回是也可以携带过去数据");
  }
  
  void _backToHome2(context) {
    Navigator.of(context).pushNamed('/home',arguments: "传过去的数据");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("详情页"),
        // leading: const Icon(Icons.add_a_photo), // 左边的按钮样式 默认是返回按钮
        // actions: const [Icon(Icons.add_a_photo),Icon(Icons.add_a_photo)], // 右边的action
      ),
      body: Column(
        children: [const Text("详情页"), Column(
          children: [
            Text("传递过来的数据$message"),
            OutlinedButton(onPressed: () => _backToHome(context), child: const Text("回到首页方式一")),
            OutlinedButton(onPressed: () => _backToHome2(context), child: const Text("回到首页方式二")),
          ],
        )],
      ),
    );
  }
}
