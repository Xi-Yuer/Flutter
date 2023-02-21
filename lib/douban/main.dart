import 'package:demo/douban/pages/main/main.dart';
import 'package:flutter/material.dart';

main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent,useMaterial3: true),
      home: const Main(),
    );
  }
}
