import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;

    /// 通知所有的依赖组件进行视图更新
    notifyListeners();
  }

  void add() {
    _counter++;
    notifyListeners();
  }
}