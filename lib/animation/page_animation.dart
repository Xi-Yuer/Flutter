import 'package:flutter/material.dart';

main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("标题"),
          ),
        ),
        body: const Home(),
        // floatingActionButton: FloatingActionButton(onPressed: () {  },
        // child: const Icon(Icons.add_circle_outline),),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  /// 页面跳转方式一（默认）
  void jupToAbout1(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const About()));
  }

  /// 页面跳转方式二（自定义动画跳转）
  void jupToAbout2(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
      return FadeTransition(opacity: animation1, child: const About()); /// 页面渐变跳转
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () => jupToAbout2(context), child: const Text("页面跳转")),
    );
  }
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("关于"),
      ),
      body: const Center(
        child: Text("关于页面"),
      ),
    );
  }
}
