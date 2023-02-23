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

/// 实现动画的组件需要混入 SingleTickerProviderStateMixin
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    /// vsync :同步信号（this => width SingTickerProviderStateMixin）
    /// forword :向前执行动画
    /// reverse :翻转执行动画
    ///  CuredAnimation : 作用:动画执行的速率
    ///  Tween ：设置动画执行的范围
    ///         begin：开始值 end:结束值
    final AnimationController controller = AnimationController(vsync:this);

    /// 动画速率
    CurvedAnimation(parent: controller,curve: Curves.easeIn);

    final animation = Tween(begin:100 ,end:200).animate(controller);


    return const Text("文本");
  }
}
