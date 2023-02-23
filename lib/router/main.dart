import 'package:demo/router/pages/detail.dart';
import 'package:demo/router/pages/not_fond.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home":(ctx) => const Home()
      },
      initialRoute: "/home",
      /// 携带参数跳转
      onGenerateRoute: (settings){
        if(settings.name == "/detail") {
          return MaterialPageRoute(
              builder: (ctx){
                return DetailPage(settings.arguments as String);
          });
        }
        return null;
      },

      // 404 页面配置
      onUnknownRoute:(setting){
        return MaterialPageRoute(builder: (ctx)=>const NotFond());
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _jumpToPage(BuildContext context) {
    /// 页面跳转
    Future result = Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailPage("跳转至详情页跳转方式一")));

    // 拿到路由返回时穿传过来的数据
    result.then((value) {
      if (kDebugMode) {
        print(value);
      }
    });
  }

  void _jumpToPage2(content) {
    Future result = Navigator.of(context).pushNamed("/detail",arguments: "跳转至详情页跳转方式二");
    // 拿到路由返回时穿传过来的数据
    result.then((value) {
      if (kDebugMode) {
        print(value);
      }
    });
  }

  void _jumpToPage3(content) {
    Navigator.of(context).pushNamed("/abc");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Column(
        children: [
          OutlinedButton(onPressed: () => _jumpToPage(context), child: const Text("跳转至详情页跳转方式一")),
          OutlinedButton(onPressed: () => _jumpToPage2(context), child: const Text("跳转至详情页跳转方式二")),
          OutlinedButton(onPressed: () => _jumpToPage3(context), child: const Text("跳转至404页面")),
        ],
      ),
    );
  }
}
