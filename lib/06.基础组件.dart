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
  static const TextStyle style =
  TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold);

  void btnClick() {
    if (kDebugMode) {
      print("click");
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildIcon();
  }

  // 图标
  Icon buildIcon() => const Icon(Icons.add_a_photo,size: 30,color: Colors.purple,);

  FadeInImage buildFadeInImage() {
    return const FadeInImage(
        placeholder: AssetImage("assets/imges/61f1-kkciesr6586428.jpg"), // 当网络图未加载完成是显示的图片
        image: NetworkImage(
            "https://koko-img-oss.oss-cn-chengdu.aliyuncs.com/3152985137c6cdf93de6bb58db9a270f.jpeg"));
  }

  // 加载本地图片
  // Image(image: AssetImage("assets/imges/61f1-kkciesr6586428.jpg"));
  Image buildImageAsset() =>
      Image.asset("assets/imges/61f1-kkciesr6586428.jpg");

  // 图片（加载网络图片）
  Image buildImage() {
    return const Image(
      image: NetworkImage(
          "https://koko-img-oss.oss-cn-chengdu.aliyuncs.com/3152985137c6cdf93de6bb58db9a270f.jpeg"),
      width: 200,
      height: 200,
      fit: BoxFit.fitWidth,
      // repeat: ImageRepeat.repeatX, // 图片重复
      // color: Colors.blue, // 将该颜色混入到图片中
      // colorBlendMode: BlendMode.colorBurn,
      alignment: Alignment(0, 0),
    );
  }

  // 按钮
  Column buildColumnButton() {
    return Column(
      children: [
        TextButton(onPressed: btnClick, child: const Text("按钮")),
        MaterialButton(
          onPressed: btnClick,
          child: const Text("按钮"),
        ),
        OutlinedButton(onPressed: btnClick, child: const Text("按钮")),
        FloatingActionButton(
          onPressed: btnClick,
          tooltip: "按钮",
          child: const Icon(Icons.add),
        ),
        //  自定义 Button
        TextButton(
            onPressed: btnClick,
            style: const ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                    TextStyle(fontSize: 18, color: Colors.blue)),
                backgroundColor: MaterialStatePropertyAll(Colors.blue)),
            child: Row(
              children: const [
                Icon(
                  Icons.add,
                  color: Colors.white,
                )
              ],
            )),
        IconButton(onPressed: btnClick, icon: const Icon(Icons.add))
      ],
    );
  }

  // 富文本 Text.rich
  Text buildTextRich() {
    return const Text.rich(TextSpan(
      // text: "hello world",
      // style: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20
      // )
        children: [
          TextSpan(text: "hello", style: TextStyle(color: Colors.red)),
          WidgetSpan(child: Icon(Icons.ice_skating_sharp, color: Colors.red)),
          TextSpan(text: "hi", style: TextStyle(color: Colors.blue))
        ]));
  }

  // 文本 Text
  Text buildText() => const Text("文本组件文本组件文本组件文本组件",
      style: style,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis);
}
