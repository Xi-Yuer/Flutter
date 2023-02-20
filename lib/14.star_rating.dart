import 'package:flutter/material.dart';

class StartRating extends StatefulWidget {
  final double rating; // 当前分数
  final double maxRating; // 满分是多少？
  final int count; // 展示多少颗心❤
  final double size; // 星的大小
  final Color unselectedColor; // 未选中的星的颜色
  final Color selectedColor; // 选中时星的颜色

  final Widget unselectedImage;
  final Widget selectedImage;

   StartRating({super.key,
    required this.rating,
    this.maxRating = 10,
    this.size = 30,
    this.count = 5,
    this.unselectedColor = Colors.grey,
    this.selectedColor = Colors.orange,
    Widget? unselectedImage, // 未选中的图标
    Widget? selectedImage,   // 选中的图标
  }):unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size:size),
        selectedImage = selectedImage ??  Icon(Icons.star, color: selectedColor, size:size);

  @override
  State<StartRating> createState() => _StartRating();
}

class _StartRating extends State<StartRating> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildRow(buildUnselectedStarList()),
          // 实心覆盖掉空心
          buildRow(buildSelectedStar()),
        ],
      ),
    );
  }

  Row buildRow(List<Widget> child) =>
      Row(mainAxisSize: MainAxisSize.min, children: child);

  List<Widget> buildSelectedStar() {
    // 构建选中的心
    List<Widget> stars = [];
    final start = widget.selectedImage;
    // 构建填充满的心
    double oneValue = widget.maxRating / widget.count; // 总分 / 星的个数 = 每个星的分数
    int entireCount = (widget.rating / oneValue).floor(); // 当前的分数 / 每个星需要的分 = 满星的个数
    // 添加满星
    for (var i = 0; i < entireCount; i++) { stars.add(start);}
    // 添加不满的星(裁剪星)
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    stars.add(ClipRect(clipper: _StartCliper(leftWidth),child: start));

    if(stars.length > widget.count) {
      return stars.sublist(0,widget.count);
    }
    return stars;
  }

  List<Widget> buildUnselectedStarList() {return List.generate(widget.count, (index) => widget.unselectedImage);}
}

class _StartCliper extends CustomClipper<Rect> {

  double width;

  _StartCliper(this.width);

  @override
  Rect getClip(Size size) {return Rect.fromLTRB(0, 0, width, size.height);}

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // throw UnimplementedError();
    return true;  // 什么时候裁剪(要不要裁剪)
  }

}
