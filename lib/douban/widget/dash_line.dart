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
          body: Center(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.red)),
                  child: const DashLine(),
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.red)),
                  child: const DashLine(
                    axis: Axis.vertical,
                    dashHeight: 8,
                    dashWidth: 1,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class DashLine extends StatelessWidget {
  final Axis axis;
  final double dashWidth;
  final double dashHeight;
  final int count;
  final Color color;

  const DashLine(
      {Key? key,
      this.axis = Axis.horizontal,
      this.dashWidth = 8,
      this.dashHeight = 1,
      this.count = 10,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          count,
          (index) => SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              )),
    );
  }
}
