import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplates/utility/imageutil.dart';

class HeroDetail extends StatelessWidget {
  final String image;
  final int index;
  HeroDetail({required this.image, required this.index});

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hero Detail"),
        ),
        body: SafeArea(
            child: Container(
                child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Hero(
                tag: index,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: imageLoader("assets/images/cake1.jfif", image),
                ),
              ),
            ),
            Text("image ${index.toString()}")
          ],
        ))));
  }
}
