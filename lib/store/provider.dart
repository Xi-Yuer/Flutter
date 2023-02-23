import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './view_model.dart';

///  使用 ChangeNotifierProvider 包裹住根组件
///  create 函数返回 stroeModel child 包裹根组件
///  创建需要共享的数据
///  获取数据方式一： Provider.of<CounterViewModel>(context).counter;
///  获取数据方式二： 使用 Cusumer函数包裹组件 Consumer<CounterViewModel>(builder: (context, value, child) => Widget  其中 value 就是值
main() => runApp(MultiProvider(  /// MultiProvider 提供多个store
  providers: [
    ChangeNotifierProvider<CounterViewModel>(
      /// create 函数需要返回我们创建的 store
      create: (context) => CounterViewModel(),
    )
  ],
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
        floatingActionButton: Consumer<CounterViewModel>(
          builder: (context, value, child) {
            return GestureDetector(
              onTap: () {
                debugPrint("构建");
                value.add();
              },
              child: child,
            );
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
            width: 50,
            height: 50,
            child: const Icon(Icons.add, color: Colors.white),
          ),
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

    return Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Consumer<CounterViewModel>(builder: (context, value, child) => Text("当前计数：${value.counter}")));
  }
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 通过该方式获取数据
    int counter = Provider.of<CounterViewModel>(context).counter;

    return Container(height: 100, color: Colors.blue, alignment: Alignment.center, child: Text("About 当前计数: $counter"));
  }
}
