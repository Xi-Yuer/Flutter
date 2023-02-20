import 'package:demo/douban/pages/group/group.dart';
import 'package:demo/douban/pages/profile/profile.dart';
import 'package:demo/douban/pages/subject/subject.dart';
import 'package:flutter/material.dart';
import 'package:demo/douban/pages/mail/mail.dart';
import 'package:demo/douban/pages/home/home.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  // 页面切换
  void _navGationBarItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("豆瓣App"),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // 当 tabBar 超过四个时候需要设置这个属性
        items: _tabarlist,
        onTap: _navGationBarItemClick,
      ),
    );
  }
}

List<Widget> pages = [
  const Home(),
  const Mail(),
  const Profile(),
  const Subject(),
  const Group()
];

List<BottomNavigationBarItem> _tabarlist = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: "主页"),
  const BottomNavigationBarItem(icon: Icon(Icons.subject), label: "分类"),
  const BottomNavigationBarItem(icon: Icon(Icons.email), label: "信息"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.supervised_user_circle), label: "用户"),
  const BottomNavigationBarItem(icon: Icon(Icons.group), label: "用户组"),
];
