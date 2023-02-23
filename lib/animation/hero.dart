import 'package:demo/animation/image_detail.dart';
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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void jumToImageDetailPage(context, String imgUrl) {
    // Navigator.of(context).push(
    //     MaterialPageRoute(builder: (ctx) {
    //       return ImageDetail(imgUrl);
    //     })
    // );

    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (ctx, animation1, animation2) {
      return FadeTransition(opacity: animation1, child: ImageDetail(imgUrl));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 16 / 9),
        children: List.generate(10, (index) {
          final String imgUrl = "https://picsum.photos/200/300?random=$index";
          return GestureDetector(
            child: Hero(
              tag: imgUrl,
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            onTap: () => jumToImageDetailPage(context, imgUrl),
          );
        }));
  }
}
