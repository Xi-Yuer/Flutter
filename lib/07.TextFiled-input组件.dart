import 'package:flutter/foundation.dart';
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
  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void inputChange(value) {
    // if (kDebugMode) {
    //   print(value);
    // }
  }

  void submitClick(value) {
    // if (kDebugMode) {
    //   print("提交:$value");
    // }
  }

  void btnClick() {
    if (kDebugMode) {
      print(userNameTextController.text);
      print(passwordTextController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: userNameTextController,
            onChanged: inputChange,
            onSubmitted: submitClick,
            decoration: const InputDecoration(
              // labelText: "label",
              icon: Icon(Icons.people),
              hintText: "请输入用户名",
              border: OutlineInputBorder(),
              filled: true, // 默认以灰色填充输入框
              // fillColor: Colors.grey  // 自定义填充
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordTextController,
            decoration: const InputDecoration(
              labelText: "密码",
              icon: Icon(Icons.lock),
              hintText: "请输入密码",
              border: OutlineInputBorder(),
              filled: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 200,
                height: 32,
                child: OutlinedButton(
                    onPressed: btnClick, child: const Text("登录"))),
          )
        ],
      ),
    );
  }
}
