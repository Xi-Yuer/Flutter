import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter = 100;
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
        body:  CounterWidget(_counter, child: const Home()), // 使用时包裹住
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            _counter++;
          });
        },child: const Icon(Icons.add)),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int? counter = CounterWidget.of(context)?.counter ; // 获取到共享的 counter
    String? name = CounterWidget.of(context)?.name;


    return  Column(
      children: [
        const Text("共享的数据"),
        Text("$counter",style: const TextStyle(fontSize: 80,color: Colors.orange)),
        Text("$name",style: const TextStyle(fontSize: 80,color: Colors.orange)),
      ],
    );
  }
}




// 数据集中在这里管理,然后该组件包裹的子组件可以共享该组件中的数据
class CounterWidget extends InheritedWidget {
  const CounterWidget(this.counter, {super.key, required super.child});

  // 共享的数据
  final int counter;
  final String name = 'Tom';

  static CounterWidget?  of(BuildContext context) {
    // context.dependOnInheritedWidgetOfExactType 该方法是沿着 element 树
    return context.dependOnInheritedWidgetOfExactType<CounterWidget>();
  }

  @override
  bool updateShouldNotify(CounterWidget oldWidget) {
    if (kDebugMode) {
      print(oldWidget.counter);
    }
    return counter !=oldWidget.counter; // 返回 true 时,会通知依赖了的组件并执行组件的 didChangeDependencies 函数
  }

}
