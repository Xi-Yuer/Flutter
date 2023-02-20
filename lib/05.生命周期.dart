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
  // 构造函数生命周期
  const Home({Key? key}) : super(key: key);

  // 生命周期 createState
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // 构造函数生命周期
  _HomeState();

  // 生命周期 initState
  @override
  void initState() {
    super.initState();
  }

  // 当依赖数据改变时的回调
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // 当父组件结构发生改变时执行的回调
  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  // 生命周期 build
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  // 生命周期 dispose
  @override
  void dispose() {
    super.dispose();
  }
}

