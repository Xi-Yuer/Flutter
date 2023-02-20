import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("标题"),
          ),
        ),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0); // initialScrollOffset:滚动默认滚动的位置

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (kDebugMode) {
        // print("监听到滚动");
        // print(scrollController.offset);
      }
    });
  }

  // 回到顶部
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  bool onNotification(ScrollNotification notification) {
    if (kDebugMode) {
      print("notification:监听到滚动");
      if (notification is ScrollStartNotification) {
        print("开始滚动,一共需要滚动的距离有${notification.metrics.maxScrollExtent}");
      }
      if (notification is ScrollEndNotification) {
        print("结束滚动");
      }
      if (notification is ScrollUpdateNotification) {
        print("正在滚动,滚动的像素距离为${notification.metrics.pixels}");
      }
    }
    return true; // 返回 true 取消冒泡
  }

  @override
  Widget build(BuildContext context) {
    /*
    *  两种方式监听滚动
    *   1：controller（不可以监听开始滚动和结束滚动）
    *   2:NotificationListener
    * */
    return NotificationListener(
      onNotification: onNotification,
      child: ListView.builder(
          controller: scrollController,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) => ListTile(
                leading: const Icon(Icons.add_a_photo),
                trailing: const Icon(Icons.add),
                title: Text("联系人:$index"),
                subtitle: const Text("18483128820"),
              )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose(); // 销毁
  }
}
