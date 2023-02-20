import 'package:flutter/material.dart';

main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Center(
        //     child: Text("标题"),
        //   ),
        // ),
        body: Home(),
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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true, // 滑动距离到顶部是固定
          expandedHeight: 200, // 高度
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("标题"),
            background: Image.asset("assets/imges/61f1-kkciesr6586428.jpg",fit: BoxFit.cover),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: 4,
                (BuildContext context, int index) => const ListTile(
                      leading: Icon(Icons.add_a_photo),
                      trailing: Icon(Icons.add),
                      title: Text("联系人"),
                      subtitle: Text("18483128820"),
                    ))),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (BuildContext context, int index) => Container(
                color: Colors.purple,
                width: 200,
                height: 200,
              ),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, mainAxisSpacing: 2, crossAxisSpacing: 2))
      ],
    );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver: SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          color: Colors.purple,
                          width: 200,
                          height: 200,
                        ),
                    childCount: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                )),
          ),
        )
      ],
    );
  }
}
