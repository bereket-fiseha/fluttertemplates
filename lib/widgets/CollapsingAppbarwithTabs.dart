import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollapsingAppbarwithTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: SafeArea(
              child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              //  title: Text("appbar"),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("tab menu"),
                background:
                    Image.asset("assets/images/cake1.jfif", fit: BoxFit.cover),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SilverAppHeaderDelegate(
                  tabBar: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.purple,
                unselectedLabelColor: Colors.grey,
                tabs: listOfTabs,
              )),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          children: listOfTabs
              .map((tab) => Center(
                      child: Container(
                    width: 300,
                    height: 300,
                    child: listOfWidgets[listOfTabs.indexOf(tab)],
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  )))
              .toList(),
        ),
      ))),
    );
  }

  List<Widget> listOfWidgets = [
    Image.asset(
      "assets/images/foodheart.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset("assets/images/mygift.jpg", fit: BoxFit.cover),
    Image.asset("assets/images/giftgold.jpg", fit: BoxFit.cover)
  ];
  List<Tab> listOfTabs = [
    Tab(
      icon: Icon(Icons.home),
      text: "Cake1",
      //        child: Image.asset("assets/images/foodheart.jpg")
    ),
    Tab(
      icon: Icon(Icons.cake),
      text: "Cake2",
      //      child: Image.asset("assets/images/mygift.jpg")
    ),
    Tab(
      icon: Icon(Icons.coffee_maker),
      text: "Cake3",
      //    child: Image.asset("assets/images/giftgold.jpg")
    ),
  ];
}

class _SilverAppHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _SilverAppHeaderDelegate({required this.tabBar});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return tabBar;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SilverAppHeaderDelegate oldDelegate) {
    return false;
  }
}
