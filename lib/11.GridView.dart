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
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
        itemCount: 10, // 子组件的个数
        // 懒加载子组件(当组件需要显示时才会执行该回调)
        itemBuilder: ((BuildContext context, int index) => Container(
              width: 100,
              height: 100,
              color: Colors.purple,
            )));
  }

  // Grid布局(适用于主轴不固定元素个数,可以限制元素在主轴上最大的宽度) 可以使用 GridView.extent 替代
  GridView buildGridViewDemo02() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100, // 最大 100
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      children: List.generate(100,
          (index) => Container(width: 200, height: 200, color: Colors.purple)),
    );
  }

  // Grid布局(适用于主轴固定元素个数) 可以使用 GridView.count 替代
  Padding buildGridViewDemo1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 主轴上元素的个数
          mainAxisSpacing: 2, // 主轴的间距
          crossAxisSpacing: 2, // 交叉轴的间距
          // mainAxisExtent: 10, //
        ),
        children: List.generate(
            100,
            (index) =>
                Container(width: 200, height: 200, color: Colors.purple)),
      ),
    );
  }
}
