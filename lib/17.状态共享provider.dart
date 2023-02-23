import 'package:demo/17.%E5%85%B1%E4%BA%AB%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8Bview_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///  使用 ChangeNotifierProvider 包裹住根组件
///  create 函数返回 stroeModel child 包裹根组件
///  创建需要共享的数据
main() => runApp(ChangeNotifierProvider(
      /// create 函数需要返回我们创建的 store
      create: (BuildContext context) {
        return CounterViewModel();
      },
      child: const App(),
    ));

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Home(), About()],
        ),
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
    /// 通过该方式获取数据
    int counter = Provider.of<CounterViewModel>(context).counter;

    return Container(height: 100, color: Colors.orange, alignment: Alignment.center, child: Text("Home$counter"));
  }
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, color: Colors.blue, alignment: Alignment.center, child: const Text("About"));
  }
}
