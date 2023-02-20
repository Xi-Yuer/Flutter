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
  @override
  Widget build(BuildContext context) {
    return buildListViewSeparated();
  }

  ListView buildListViewSeparated() {
    return ListView.separated(
    // 构建子元素发回调函数
    itemBuilder: (BuildContext context, int index) =>
        Text("Hello World$index"),
    cacheExtent: 200, // 预加载的高度
    // 子元素的大小
    itemCount: 100,

    // 每个子元素之间的分割线
    separatorBuilder: (BuildContext context, int index) => const Divider(
      color: Colors.red, // 分割线的颜色
      thickness: 5,  // 分割线的宽度
      height: 100, // 分割线的高度
    ),
  );
  }

  ListView buildListViewBulider() {
    return ListView.builder(
        itemCount: 100, // 告诉他要渲染多少个子元素
        itemExtent: 60, // 每个子元素的高度
        // 构建子元素发回调函数
        itemBuilder: (BuildContext context, int index) {
          // 回调函数返回一个子组件元素,该回调会在需要显示该组件时才会执行，类似于懒加载
          return Text("Hello World$index");
        });
  }

  // 当确定有多少个子元素列表时使用 ListView
  ListView buildListView() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(
          100,
          (index) => ListTile(
                leading: const Icon(Icons.add_a_photo),
                trailing: const Icon(Icons.delete),
                title: Text("联系人:${index + 1}"),
                subtitle: const Text("18483128820"),
              )),
    );
  }
}
