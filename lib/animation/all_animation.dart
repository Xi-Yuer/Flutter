import 'dart:math';

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
        body: const AllAnimation(),
      ),
    );
  }
}

class AllAnimation extends StatefulWidget {
  const AllAnimation({Key? key}) : super(key: key);

  @override
  State<AllAnimation> createState() => _AllAnimationState();
}

class _AllAnimationState extends State<AllAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Animation sizeAnim;
  late Animation colorAnim;
  late Animation opacityAnim;
  late Animation rotateAnim;


  @override
  void initState() {
    super.initState();

    /// 动画控制器
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    /// 动画速率控制器
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    /// 大小动画-颜色动画-不透明度-旋转
    sizeAnim = Tween(begin: 10.0, end: 200.0).animate(controller); // 控制大小
    colorAnim = ColorTween(begin: Colors.orange, end: Colors.blue).animate(controller); // 控制颜色
    opacityAnim = Tween(begin: 0.0, end: 1.0).animate(controller); // 控制不透明度
    rotateAnim = Tween(begin: 0.0, end: pi * 2).animate(controller); // 控制旋转

    /// 动画执行时监听
    controller.addListener(() {
      setState(() {}); /// 刷新页面
    });

    /// 动画一直执行下去
    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });

  }

  /// 执行动画
  playAnimation(){
    if(controller.isAnimating){
      controller.stop();
    }else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("执行build方法");
    return Scaffold(
      body: Center(
        child: Opacity(
          // opacity 值可以控制子元素的不透明度
          opacity: opacityAnim.value,
          child: Transform(
            transform: Matrix4.rotationZ(rotateAnim.value), // pi == 180deg
            alignment: Alignment.center,
            child: Container(
              width: sizeAnim.value,
              height: sizeAnim.value,
              color: colorAnim.value,
              // transform: Matrix4.rotationZ(rotateAnim.value), /// 或者这样也可以实现旋转
              // transformAlignment: Alignment.center,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:playAnimation, child: const Icon(Icons.play_arrow)),
    );
  }
}
