import 'package:flutter/cupertino.dart';

class CounterViewModel extends ChangeNotifier {
  late int _counter;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    /// 通知所有的依赖组件进行视图更新
    notifyListeners();
  }
}