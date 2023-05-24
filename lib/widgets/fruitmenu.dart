import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertemplates/model/cartitem.dart';
import 'package:fluttertemplates/model/enum.dart';
import 'package:fluttertemplates/service/cartprovider.dart';
import 'package:fluttertemplates/service/fruitservice.dart';
import 'package:fluttertemplates/widgets/cartpage.dart';
import 'package:fluttertemplates/widgets/itemfruitorder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../interface/Ifruitservice.dart';
import '../model/fruit.dart';

class FruitMenu extends StatefulWidget {
  @override
  State<FruitMenu> createState() => _FruitMenuState();
}

class _FruitMenuState extends State<FruitMenu> {
  var _selectedIndex = 1;
  List<Fruit> fruits = [];
  double sumOfPrices = 0;
  List<CartItem> cartItems = [
    CartItem(
        itemId: "3",
        image: "",
        itemTitle: "Orange",
        quantity: 4,
        itemCategory: ItemCategory.Fruit,
        price: 55,
        userId: "554545"),
    CartItem(
        itemId: "4",
        image: "",
        itemTitle: "Banana",
        quantity: 2,
        itemCategory: ItemCategory.Fruit,
        price: 100,
        userId: "53455"),
    CartItem(
        itemId: "5",
        image: "",
        itemTitle: "Apple",
        quantity: 6,
        itemCategory: ItemCategory.Fruit,
        price: 455,
        userId: "5544545"),
  ];
  late IFruitService fruitService;
  @override
  void initState() {
    super.initState();
    fruitService = FruitService();

    getAllFruits();
    // setState(() {
    //   fruits = allfruits;
    // });
    for (var x in cartItems) {
      sumOfPrices += x.price;
    }
  }

  void getAllFruits() async {
    var listOfFruits = await fruitService.getAllFruits();
    setState(() {
      fruits = listOfFruits;
    });
  }

  void filterFruitsBySearchTerm(String term) {
    setState(() {
      fruits = allfruits.where((element) => element.tag == term).toList();
    });
  }

  void filterFruitsByTag(String term) async {
    var fruitsFilterdByTag = await fruitService.getFruitsFilteredByTag(term);

    setState(() {
      fruits = fruitsFilterdByTag;
    });
  }

  void onFavIconPressed(int index) {
    setState(() {
      fruits[index].fav = !fruits[index].fav;
      // fruits = allfruits.where((element) => element.tag == "apple").toList();
    });
  }

  List<Fruit> allfruits = [
    Fruit(
        fav: false,
        description:
            "this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit this is the description of the fruit, this is the description of the fr this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit this is the description of the fruit, this is the description of the fruit  this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit this is the description of the fruit, this is the description of the fr this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit this is the description of the fruit, this is the description of the fruit",
        tag: "mango",
        fruitName: "mango",
        imageSrc: "assets/images/mango2.png",
        price: "30",
        healthBenefits: [
          "good for hair",
          "good for eye",
          "good for out heart",
          "good for skin",
          "keeps our blood presure low"
        ]),
    Fruit(
        fav: false,
        description:
            "this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit, this is the description of the fruit this is the description of the fruit, this is the description of the fruit",
        fruitName: "banana",
        imageSrc: "assets/images/bananas.png",
        price: "40",
        healthBenefits: [
          "is good for hair,that is keeps the hair dry and healthy ,it also helps the hair to be ..",
          "good for eye",
          "good for out heart",
          "good for skin",
          "keeps our blood presure low"
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: FruitMenuBody(
            height: height,
            width: width,
            fruits: fruits,
            searchOnPressed: filterFruitsByTag,
            onFavIconPressedCallBack: onFavIconPressed),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.deepOrange,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Stack(alignment: Alignment.center, children: [
                    Container(
                      width: 60,
                      height: kBottomNavigationBarHeight,
                    ),
                    IconButton(
                        icon: const Icon(FontAwesomeIcons.cartShopping),
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CartPage()));
                        }),
                    Consumer<CartProvider>(
                      builder: (context, provider, child) => Positioned(
                          left: 40,
                          top: 0,
                          child: Text(
                            "${provider.getCartItems().length}",
                            style: const TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ]),
                  label: "My Cart"),
              BottomNavigationBarItem(
                  icon: IconButton(
                      icon: const Icon(Icons.apple),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                        getAllFruits();
                      }),
                  label: "Fruits"),
              BottomNavigationBarItem(
                  icon: IconButton(
                      icon: const Icon(FontAwesomeIcons.egg),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      }),
                  label: "Vegetables")
            ]));
  }
}

class FruitMenuBody extends StatelessWidget {
  final Function(String term) searchOnPressed;

  final Function(int index) onFavIconPressedCallBack;

  const FruitMenuBody(
      {Key? key,
      required this.height,
      required this.width,
      required this.fruits,
      required this.searchOnPressed,
      required this.onFavIconPressedCallBack})
      : super(key: key);

  final double height;
  final double width;
  final List<Fruit> fruits;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(color: Colors.grey[300]),
          PositionedOrangeContainer(height: height),
          PositionedSmallerCircularContainer(width: width),
          PositionedBiggerCircularContainer(width: width),
          Positioned(
            top: 0,
            left: width / 10,
            right: 0.0,
            bottom: 0.0,
            child: Column(children: [
              SizedBox(
                height: height / 12,
              ),
              const ListViewColumnTextHeader(),
              ListViewSearchTextField(
                searchOnPressed: searchOnPressed,
              ),
              ListViewRowOfTwoFruits(
                fruits: fruits,
                onFavIconPressedCallBack: onFavIconPressedCallBack,
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class ListViewRowOfTwoFruits extends StatelessWidget {
  const ListViewRowOfTwoFruits(
      {Key? key, required this.fruits, required this.onFavIconPressedCallBack})
      : super(key: key);

  final List<Fruit> fruits;
  final Function(int index) onFavIconPressedCallBack;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: fruits.asMap().entries.map((fruit) {
          return (fruit.key % 2 == 0)
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FruitMenuItem(
                          index: fruit.key,
                          onFavIconPressedCallBack: onFavIconPressedCallBack,
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ItemFruitOrder(fruit: fruit.value)))
                              },
                          fruit: fruit.value),
                    ),
                    fruit.key + 1 < fruits.length
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            child: FruitMenuItem(
                                index: fruit.key + 1,
                                onFavIconPressedCallBack:
                                    onFavIconPressedCallBack,
                                onPressed: () => {
                                      //   Navigator.pushNamed(context,
                                      //       "/${fruit.value.fruitName}page")
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ItemFruitOrder(
                                                      fruit: fruits[
                                                          fruit.key + 1])))
                                    },
                                fruit: fruits[fruit.key + 1]),
                          )
                        : Container()
                  ],
                )
              : Container();
        }).toList(),
      ),
    );
  }
}

class ListViewSearchTextField extends StatelessWidget {
  ListViewSearchTextField({Key? key, required this.searchOnPressed})
      : super(key: key);
  final Function(String term) searchOnPressed;
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                searchOnPressed(_searchController.text);
              },
              child: CircleAvatar(
                foregroundColor: Colors.grey[350],
                backgroundColor: Colors.white,
                child: const Icon(Icons.search),
              ),
            ),
            suffixIconColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            filled: true,
            hintStyle: const TextStyle(color: Colors.black),
            hintText: "Search...",
            fillColor: Colors.white),
      ),
    );
  }
}

class ListViewColumnTextHeader extends StatelessWidget {
  const ListViewColumnTextHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
            padding: EdgeInsets.only(top: 30.0, left: 0, right: 8),
            child: Text(
              "Fresh, Rich",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            )),
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            "Fruits",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class PositionedBiggerCircularContainer extends StatelessWidget {
  const PositionedBiggerCircularContainer({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: width / 2,
        child: Center(
            child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(150))),
        )));
  }
}

class PositionedSmallerCircularContainer extends StatelessWidget {
  const PositionedSmallerCircularContainer({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: width / 4,
        child: Center(
            child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(100))),
        )));
  }
}

class PositionedOrangeContainer extends StatelessWidget {
  const PositionedOrangeContainer({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      height: height / 2.2,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    ));
  }
}

class FruitMenuItem extends StatelessWidget {
  final Fruit fruit;
  final int index;
  final VoidCallback onPressed;
  final Function(int) onFavIconPressedCallBack;
  const FruitMenuItem(
      {super.key,
      required this.index,
      required this.fruit,
      required this.onPressed,
      required this.onFavIconPressedCallBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.green),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(fruit.imageSrc),
              )),
              Text(fruit.fruitName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.deepOrange,
                      child: Text("\$ ${fruit.price}",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white)),
                    ),
                    InkWell(
                      onTap: () => onFavIconPressedCallBack(index),
                      child: Icon(
                        size: 30,
                        fruit.fav
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
