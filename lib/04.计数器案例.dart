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
  int counter = 0;

  final btnStyle1 = ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple));
  final btnStyle2 = ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black12));
  static const textStyle = TextStyle(color: Colors.blue,fontSize: 30);

  void increment(){
    setState(() {
      counter++;
    });
  }
  void decrement(){
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 居中
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // 居中
            children: [
              TextButton(onPressed:increment,style: btnStyle1,child: const Text("+")),
              TextButton(onPressed:decrement,style: btnStyle2,child: const Text("-")),
            ],
          ),
          Text("当前计数:$counter",style: textStyle,)
        ],
      ),
    );
  }
}
