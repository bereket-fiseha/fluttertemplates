import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplates/model/cartitem.dart';
import 'package:fluttertemplates/model/enum.dart';
import 'package:fluttertemplates/service/cartprovider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../model/fruit.dart';

class ItemFruitOrder extends StatelessWidget {
  final Fruit fruit;

  ItemFruitOrder({required this.fruit});
  List<Image> images = [
    Image.asset("assets/images/mango2.png"),
    Image.asset("assets/images/more apple.png"),
    Image.asset("assets/images/bananas.png")
  ];
  List<Tab> listOfTabs = [
    Tab(
      icon: Icon(FontAwesomeIcons.cartPlus),
      text: "Order",
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.magnifyingGlassPlus),
      text: "Health Benefits",
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.registered),
      text: "Fruit Cart",
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.amber,
                  expandedHeight: 300,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(fruit.fruitName),
                    background: CarouselSlider(
                      options: CarouselOptions(
                        autoPlayInterval: const Duration(milliseconds: 3000),
                        aspectRatio: 1.0,
                        viewportFraction: .95,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.elasticOut,
                        // enlargeCenterPage: true,
                        autoPlay: true,
                      ),
                      items:
                          fruit.allImages.map((x) => Image.asset(x)).toList(),
                    ),
                    //background: Imrage.asset(fruit.imageSrc, fit: BoxFit.cover),
                  ),
                ),
                SliverPersistentHeader(
                    pinned: true,
                    delegate: TabSilverHeaderDelegate(
                        child: TabBar(
                      tabs: listOfTabs,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.purple,
                      unselectedLabelColor: Colors.grey,
                    ))),
              ];
            },
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: TabBarView(children: listOfWidgets(fruit)),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> listOfWidgets(Fruit fruit) => [
      ItemOrder(fruit: fruit),
      HealthBenefitTab(listOfHealthBenefits: fruit.healthBenefits),
      Image.asset("assets/images/giftgold.jpg", fit: BoxFit.cover)
    ];

class ItemOrder extends StatefulWidget {
  final Fruit fruit;

  ItemOrder({required this.fruit});

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  int quantity = 1;
  _ItemOrderState();
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "${quantity} each",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            quantity += 1;
                          });
                        },
                        icon: Icon(FontAwesomeIcons.plus)),
                    Text("$quantity"),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            quantity -= 1;
                          });
                        },
                        icon: const Icon(FontAwesomeIcons.minus))
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Text("Price: ${double.parse(widget.fruit.price) * quantity}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20))
            ],
          ),
          Expanded(
              //height: 200,
              child:
                  ListView(children: [ItemDescription(fruit: widget.fruit)])),
          RowOfFavAndAddToCart(
              fav: widget.fruit.fav,
              item: new CartItem(
                  itemId: widget.fruit.tag,
                  itemTitle: widget.fruit.fruitName,
                  image: widget.fruit.imageSrc,
                  quantity: quantity,
                  itemCategory: ItemCategory.Fruit,
                  price: double.parse(widget.fruit.price),
                  userId: ""))
        ],
      ),
    );
  }
}

List<Widget> HealthBenefitTexts(double widthOfContainer, String healthBenefit) {
  List<Text> textWidgets = [];
  int lengthOfOriginalText = healthBenefit.length;
  int ratio = (lengthOfOriginalText / widthOfContainer.toInt()).round();
  int width = widthOfContainer.toInt();
  if (ratio > 1) {
    for (int i = 0; i < ratio; i++) {
      textWidgets
          .add(Text(healthBenefit.substring(width * i, width * (i + 1))));
    }
  } else {
    textWidgets.add(Text(healthBenefit));
  }
  return textWidgets;
}

class HealthBenefitTab extends StatelessWidget {
  final List<String>? listOfHealthBenefits;

  HealthBenefitTab({super.key, this.listOfHealthBenefits});
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: index % 3 == 0
                    ? Color.fromRGBO(181, 230, 235, 1)
                    : index % 3 == 1
                        ? Color.fromARGB(255, 220, 187, 176)
                        : Color.fromRGBO(173, 226, 207, 1),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 3),
                    child: Icon(
                      Icons.check_circle_rounded,
                      size: 35,
                      color: Color.fromARGB(255, 248, 76, 76),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textDirection: TextDirection.ltr,
                      listOfHealthBenefits![index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            )),
      ),
      itemCount: listOfHealthBenefits?.length,
    );
  }
}

class TabSilverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;
  TabSilverHeaderDelegate({required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
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
  final bool fav;

  final CartItem item;
  const RowOfFavAndAddToCart({Key? key, required this.fav, required this.item})
      : super(key: key);

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
                fav ? Icons.favorite_rounded : Icons.favorite_outline,
                color: Colors.amber,
              ),
            )),
          ),
          Expanded(child: Container()),
          Consumer<CartProvider>(
              builder: (context, provider, child) => InkWell(
                    onTap: () => !provider.itemExistsInCart(item.itemTitle)
                        ? provider.addToCart(item)
                        : provider.removeFromCart(item),
                    child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color: (!provider.itemExistsInCart(item.itemTitle)
                                ? Colors.amber
                                : Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: !provider.itemExistsInCart(item.itemTitle)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(FontAwesomeIcons.cartShopping,
                                        color: Colors.white),
                                    Text("Add To Cart",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(Icons.cancel, color: Colors.white),
                                    Text("Remove",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                        )),
                  )),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text("Product Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Column(children: [
          Text(
              fruit.description != null
                  ? fruit.description.toString().length < 600
                      ? fruit.description.toString()
                      : "${fruit.description.toString().substring(0, 600)}..."
                  : "",
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
        ]),
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
        color: Colors.black,
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
                  items: images.map((image) => image).toList(),
                )
                //   child: Image.asset(
                //     "assets/images/mango2.png",
                //   ),
                ),
          ],
        ));
  }
}
