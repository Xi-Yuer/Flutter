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
  bool isFavor = false;

  @override
  Widget build(BuildContext context) {
    void btcClick() {
      setState(() {
        isFavor = !isFavor;
      });
    }

    // Stack 层叠组件 可以将多个元素层叠到一起，层叠的z-index就是子元素的书写位置，最后的元素位于最上方
    // Stack 默认大大小是子元素的最大内容
    return Stack(
      alignment: Alignment.center, // 子元素的对其方式
      // fit: StackFit.expand, // 将子元素拉伸极可能的大
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Image.network(
          "https://koko-img-oss.oss-cn-chengdu.aliyuncs.com/3152985137c6cdf93de6bb58db9a270f.jpeg",
          width: 200,
        ),
        Container(
          color: Colors.red,
          width: 150,
          height: 150,
        ),
        // Positioned 定位元素
        const Positioned(left: 0, top: 0, child: Text("图片")),
        IconButton(
          onPressed: btcClick,
          icon: const Icon(Icons.favorite),
          color: isFavor ? Colors.white : Colors.orange,
        )
      ],
    );
  }

  // Expanded 继承自 Flexible,只是已经将 fit 设置为了 fit: FlexFit.tight,
  Row buildExpanded() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Expanded 将包裹元素拉伸父元素的剩余空间 相当于 Flexible fit: FlexFit.tight,
        Expanded(
            flex: 1,
            child: Container(width: 30, height: 60, color: Colors.red)),
        Expanded(
            flex: 2,
            child: Container(width: 50, height: 60, color: Colors.blue)),
        Container(width: 40, height: 60, color: Colors.orange),
        Container(width: 70, height: 60, color: Colors.pink),
      ],
    );
  }

  // Flexibel
  Row buildRowFlexibel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Flexible fit:FlexFit.tight ：将父元素的剩余空间全部给包裹的元素
        Flexible(
            fit: FlexFit.tight,
            flex: 1, // 分配空间占比
            child: Container(width: 30, height: 60, color: Colors.red)),
        Flexible(
            fit: FlexFit.tight,
            flex: 2, // 分配空间占比
            child: Container(width: 40, height: 60, color: Colors.orange)),
        Container(width: 50, height: 60, color: Colors.blue),
        Container(width: 70, height: 60, color: Colors.pink),
      ],
    );
  }

  // Column
  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // 元素均匀对其方式 spaceBetween、spaceAround、center ......
      crossAxisAlignment: CrossAxisAlignment.center,
      // 交叉轴的对其方式
      mainAxisSize: MainAxisSize.max,
      // 垂直方向上竟可能占据比较大/小（min，max）的空间,默认为 max
      // textDirection:TextDirection.ltr,
      textBaseline: TextBaseline.alphabetic,
      // 基线对其（对文本其效果）
      children: [
        Container(
            width: 30, height: 30, color: Colors.red, child: const Text('hi')),
        Container(
            width: 40,
            height: 70,
            color: Colors.orange,
            child: const Text('hello')),
        Container(
            width: 30, height: 50, color: Colors.blue, child: const Text('en')),
      ],
    );
  }

  // Flex
  // Axis.horizontal == row  Axis.vertical === column
  Flex buildFlex() => Flex(direction: Axis.vertical);
}
