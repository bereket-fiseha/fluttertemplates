import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Collapsable extends StatelessWidget {
  const Collapsable({super.key});
  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(
            height: heightOfScreen / 2,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)))),
        Positioned(
          top: 10.0,
          left: 10,
          right: 0.0,
          //  bottom: 0.0,
          height: heightOfScreen,
          child: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("title"),
                background:
                    Image.asset("assets/images/cake1.jfif", fit: BoxFit.cover),
              ),
              expandedHeight: 200,
              floating: true,
            ),
            SliverList(
                delegate:
                    SliverChildBuilderDelegate((context, index) => ListTile(
                          title: Text("$index child"),
                        )))
            // SliverGrid(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       mainAxisSpacing: 15,
            //       crossAxisSpacing: 15,
            //       childAspectRatio: 2.0,
            //     ),
            //     delegate: SliverChildBuilderDelegate(
            //         (context, index) => ListTile(title: Text("$index child")),
            //         childCount: 500))
          ]),
        ),
      ]),
    );
  }
}
