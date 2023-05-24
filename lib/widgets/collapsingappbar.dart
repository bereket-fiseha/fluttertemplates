import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollapsingAppBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      // appBar: AppBar(
      //   title: Text("news"),
      //   actions: [Icon(Icons.arrow_back)],
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          child: CustomScrollView(
            slivers: <Widget>[
              //2
              SliverAppBar(
                // bottom: AppBar(
                //   title: Container(
                //     height: 45,
                //     child: TextField(
                //       decoration: InputDecoration(
                //           border: OutlineInputBorder(),
                //           hintText: 'Enter a search term'),
                //     ),
                //   ),
                // ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                expandedHeight: 250.0,
                pinned: true,
                //snap: true,
                // floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text("Chocolate"),
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    child: Image.asset(
                      'assets/images/cake1.jfif',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              //3
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return ListTile(
                      leading: Container(
                          padding: EdgeInsets.all(8),
                          width: 100,
                          child: Placeholder()),
                      title: Text('Place ${index + 1}', textScaleFactor: 2),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
