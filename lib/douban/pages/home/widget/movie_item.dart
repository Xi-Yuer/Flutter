import 'package:demo/douban/model/home_model.dart';
import 'package:demo/douban/widget/dash_line.dart';
import 'package:demo/douban/widget/star_rating.dart';
import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget(this.movie, this.index,{Key? key}) : super(key: key);

  final MoviceItem movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 8,
            color: Color(0xA8D2D1D1)
          )
        )
      ), // 底部的边框
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          buildHeader(),
          buildContent(),
          buildFooter(),
        ],
      ),
    );
  }

  // 头部
  Widget buildHeader(){
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 205, 144),
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text("NO.${index+1}",style: const TextStyle(
        color: Color.fromARGB(255, 131, 95, 36)
      ),),
    );
  }

  // 内容
  Widget buildContent(){
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(),
          buildContentInfo(),
          buildContentLine(),
          buildContentWish()
        ],
      ),
    );
  }

  Widget buildContentInfo() => Expanded(
    child: Container(
      padding: const EdgeInsets.all(10),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentTitle(),
          buildContentRating(),
          buildContentDesc()
        ],
      ),
    ),
  );

  Widget buildContentTitle(){
    return Row(
      children: [
        const Icon(Icons.play_circle_outline,color: Colors.redAccent,size: 20,),
        Text(movie.title,overflow:TextOverflow.ellipsis,maxLines: 1, style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
        Text("(${movie.year})",style: const TextStyle(
          fontSize: 16,
          color: Colors.grey
        ),)
        
      ],
    );
  }

  // ClipRRect 圆角
  ClipRRect buildImage() => ClipRRect(borderRadius: BorderRadius.circular(5), child: Image.network(movie.cover_url,height: 150));

  Widget buildContentRating() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
      child: Row(
        children: [
          StartRating(rating: movie.rating.value,size: 15,),
          Text((movie.rating.value).toString(),style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }

  Widget buildContentDesc(){
    return Text(movie.card_subtitle,maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(
      fontSize: 16
    ),);
  }

  Widget buildContentLine(){
    return  Container(
      height: 100,
      alignment: Alignment.center,
      child: const DashLine(
      axis: Axis.vertical,
      count: 15,
      color: Colors.grey,
      dashWidth: 0.5,
      dashHeight: 3,
    ));
  }

  Widget buildContentWish() {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 40,
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(padding: EdgeInsets.all(5),child:  Icon(Icons.add_circle_outline,color: Colors.orange),),
          Text("想看",style: TextStyle(color: Colors.orange,fontSize: 18))
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
      color: const Color(0xe2e2e2e2),
        borderRadius: BorderRadius.circular(6)
      ),
      child: Text("演员列表：${movie.actors.map((e) => e.name).join("、")}" ,overflow: TextOverflow.ellipsis,maxLines: 5,),
    );
  }
}

