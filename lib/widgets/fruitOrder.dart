import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/fruit.dart';

class FruitOrder extends StatelessWidget {
  final Fruit fruit;
  const FruitOrder({super.key, required this.fruit});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.yellow,
          leading: IconButton(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Image.asset(
                scale: 1.6,
                "assets/images/backIcon.png",
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(FontAwesomeIcons.cartPlus),
            )
          ]),
      body: SafeArea(
        child: Stack(
          children: [
            CarousalContainer(
                images: fruit.allImages.map((x) => Image.asset(x)).toList()),
            Positioned(
              top: 220,
              height: MediaQuery.of(context).size.height / 1.6,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          ItemHeader(fruit: fruit),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "1 each",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(FontAwesomeIcons.plus),
                                Text(fruit.price.toString()),
                                const Icon(FontAwesomeIcons.minus)
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(),
                          ),
                          const Text("RS 30",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                      ItemDescription(fruit: fruit),
                      RowOfFavAndAddToCart()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // bottomSheet: BottomSheet(
      //   onClosing: () => {},
      //   builder: (BuildContext context) => Container(
      //     decoration: const BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      //   ),
      // )
    );
  }
}

class ItemHeader extends StatelessWidget {
  const ItemHeader({
    Key? key,
    required this.fruit,
  }) : super(key: key);

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          fruit.fruitName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ));
  }
}

class RowOfFavAndAddToCart extends StatelessWidget {
  const RowOfFavAndAddToCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.amber),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
                child: Container(
              child: Icon(
                size: 40,
                FontAwesomeIcons.heart,
                color: Colors.amber,
              ),
            )),
          ),
          Expanded(child: Container()),
          Container(
              width: 150,
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(FontAwesomeIcons.cartShopping, color: Colors.white),
                  Text("Add To Cart", style: TextStyle(color: Colors.white)),
                ],
              ))),
        ],
      ),
    );
  }
}

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    Key? key,
    required this.fruit,
  }) : super(key: key);

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text("Product Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Text(fruit.description!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15)),
            ]),
          ),
        ),
      ],
    );
  }
}

class CarousalContainer extends StatelessWidget {
  const CarousalContainer({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<Image> images;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 4,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(milliseconds: 2000),
                    aspectRatio: 2.0,
                    // enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: images,
                )
                //   child: Image.asset(
                //     "assets/images/mango2.png",
                //   ),
                ),
          ],
        ));
  }
}
