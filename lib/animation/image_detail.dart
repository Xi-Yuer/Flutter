import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String _src;

  const ImageDetail(this._src, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          child: Center(
            child: Hero(tag: _src, child: Image.network(_src,width: double.infinity,height: double.infinity,fit: BoxFit.cover,)),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ));
  }
}
