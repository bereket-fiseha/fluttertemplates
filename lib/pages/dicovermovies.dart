import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../const/appcolor.dart';

class DiscoverMovies extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bprimarycolor,
        appBar: AppBar(title: Text("")),
        drawer: Drawer(
            child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text("header"),
            ),
            ListTile(
              title: Text("item 1"),
            ),
            ListTile(
              title: Text("item 2"),
            )
          ],
        )),
        body: ListView(
          children: [DiscoverCarousal()],
        ));
  }
}

class DiscoverCarousal extends StatelessWidget {
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 5;
    var width = MediaQuery.of(context).size.width / 1.4;
    return Column(
      children: [
        const Text("Discover"),
        CarouselSlider(
          items: imageList
              .map((image) => DiscoverImage(image, width, height))
              .toList(),
          options: CarouselOptions(
              height: 300, autoPlay: true, viewportFraction: 0.78),
        )
      ],
    );
  }
}

Widget DiscoverImage(String image, double width, double height) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Container(
      width: width,
      height: height,
      color: Colors.yellow,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    ),
  );
}

List<String> imageList = [
  "assets/images/giftgold.jpg",
  "assets/images/mygift.jpg",
  "assets/images/cake1.jfif",
  "assets/images/apple-2.png",
  "assets/images/cake1.jfif"
];

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isActive = false;
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bprimarycolor,
      // leading: IconButton(
      //   icon: const Icon(FontAwesomeIcons.bars, color: biconcolor),
      //   onPressed: () {},
      // ),

      title: _isActive
          ? const Center(
              child: Text("Bmovies",
                  style: TextStyle(fontWeight: FontWeight.bold)))
          : Expanded(
              child: Container(
                  width: double.infinity,
                  child: AnimatedContainer(
                    child: Row(
                      children: [
                        TextFormField(
                          controller: _textEditingController,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: biconcolor,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    duration: const Duration(microseconds: 3000),
                  ))),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: biconcolor,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
