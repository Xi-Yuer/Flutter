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
        body: const Heart(),
      ),
    );
  }
}

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {

  /// 1:组件混入 SingleTickerProviderStateMixin
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Animation tweenAnimation;
  @override
  void initState() {
    super.initState();
    /// 2:创建 AnimationControler 初始化赋值
    ///       vsync:同步信号 duration:执行动画时间
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        // lowerBound: 50, // 动画初始值
        // upperBound: 250, // 动画结束值
    );

    /// 设置动画执行的曲率
    curvedAnimation = CurvedAnimation(curve: Curves.easeIn,parent: controller);

    /// 设置动画执行的初始值个结束值（这两个值要求的类型是 double）
    tweenAnimation = Tween(begin: 50.0,end: 150.0).animate(curvedAnimation);

    // 执行动画时，值发生改变旧值执行这个函数
    controller.addListener(() {
      // 这里我们只刷新页面
      setState(() {});
    });

    /// 监听动画状态的改变
    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){ /// 动画执行完成
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){ /// 表示动画结束并且当前处于开始位置
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Icon(Icons.favorite,color: Colors.red,size: tweenAnimation.value,),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: (){
          if(controller.isAnimating){ // 动画是否正在执行
            controller.stop(); // 停止动画
          }else{
            // 按钮点击时执行动画 向前执行动画
            controller.forward();
          }
        },
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose(); /// 动画销毁
  }
}




