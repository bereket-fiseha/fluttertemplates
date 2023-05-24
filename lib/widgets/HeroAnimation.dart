import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertemplates/widgets/herodetail.dart';

import '../utility/imageutil.dart';

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(title: Text("Hero List ")),
        body: SafeArea(
            child: ListView.builder(
                itemCount: _images.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => HeroDetail(
                                      image: _images[index], index: index)));
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Hero(
                                  tag: index,
                                  child: SizedBox(
                                    height: height / 4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: imageLoader(
                                          "assets/images/cake1.jfif",
                                          _images[index]),
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 10),
                            Expanded(child: Text("Title $index"))
                          ],
                        ),
                      ),
                    ))));
  }

  final List<String> _images = [
    'https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/273935/pexels-photo-273935.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/1591373/pexels-photo-1591373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/462024/pexels-photo-462024.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ];
}
