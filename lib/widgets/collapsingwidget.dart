import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollapsingWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    expandedHeight: 200,
                    floating: true,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text(
                          "Us government decided to work with iran."),
                      background: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0),
                        ),
                        child: Image.asset(
                          "assets/images/cake1.jfif",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ];
            },
            body: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text("item $index"));
                })),
      ),
    );
  }
}
