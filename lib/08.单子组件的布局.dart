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
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      // alignment: Alignment.center,
      child: const Text("文本",
          style: TextStyle(
            backgroundColor: Colors.orange,
            color: Colors.red,
          )),
    );
  }

  Container _buildContainer() {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      // 设置子元素的位置
      // color: Colors.red,
      padding: const EdgeInsets.all(10),
      // 内边距
      margin: const EdgeInsets.all(10),
      // 外边距
      // transform: Matrix4.rotationZ(45), // 变形旋转
      decoration: BoxDecoration(
          // Container 装饰
          color: Colors.orange, // 颜色
          border: Border.all(
            // 边框
            width: 10,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(100), // 圆角效果
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(10, 10), // 偏移 x,y
                spreadRadius: 5, // 衍生
                blurRadius: 10 // 模糊度
                )
          ]),
      child: const Text("Hi"),
    );
  }

  // Padding 内边距组件
  Padding buildPadding() {
    return const Padding(
      // padding: EdgeInsets.all(8.0), // 设置四个方向的内边距
      padding: EdgeInsets.only(
        bottom: 10,
        top: 10,
        // ...
      ), // 单独设置四边的内边距，可选参数
      child: Text("文本"),
    );
  }

  // Align 组件（设置组件的位置）
  Container buildContainer() {
    return Container(
      color: Colors.red,
      width: 200,
      height: 200,
      child: const Align(
        alignment: Alignment(0, 0), // 0,0 表示中心轴范围 [-1,1] 数据大于就超出
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
