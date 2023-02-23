import 'package:flutter/material.dart';

class NotFond extends StatelessWidget {
  const NotFond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("页面不存在"),
      ),
      body: Column(
        children:  [
          const Text("页面不存在，点击返回"),
          OutlinedButton(onPressed: (){
            Navigator.of(context).pushNamed("/home");
          }, child: const Text("返回"))
        ],
      ),
    );
  }
}
