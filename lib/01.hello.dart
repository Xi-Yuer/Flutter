import 'package:flutter/material.dart';

main() => runApp(const App());

// 有状态的 StatefulWidget
// 无状态的 StatelessWidget
class App extends StatelessWidget {
  const App({super.key});

  @override
  //无状态的 Widget build 渲染组件
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "标题",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: const Content());
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: const [Text("你好")],
      ),
    );
  }
}
