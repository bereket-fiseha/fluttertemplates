import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplates/model/cartitem.dart';
import 'package:fluttertemplates/service/cartprovider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage();
  Widget build(BuildContext context) {
    final TextStyle boldText = TextStyle(fontWeight: FontWeight.bold);
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(children: [
        Container(
          color: Color.fromRGBO(238, 238, 238, 1),
          height: heightOfScreen,
          width: double.infinity,
        ),
        Consumer<CartProvider>(
          builder: (context, provider, child) => ListView.builder(
              itemCount: provider.getCartItems().length,
              itemBuilder: ((context, index) => CartItemContainer(
                    cartItem: provider.getCartItems()[index],
                    provider: provider,
                    index: index,
                  ))),
        ),
      ]),
      bottomNavigationBar: Container(
          width: double.infinity,
          height: heightOfScreen / 8,
          color: const Color.fromRGBO(209, 209, 209, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Checkout Price",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: boldText.fontWeight),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Consumer<CartProvider>(
                      builder: ((context, provider, child) => Text(
                            "\$ ${provider.getCartItems().length > 1 ? provider.getCartItems().map((e) => e.totalPrice).reduce((value, element) => value + element) : 0}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: boldText.fontWeight),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    color: Colors.amber,
                    width: double.infinity,
                    height: kBottomNavigationBarHeight,
                    child: const Center(
                        child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ))),
              )
            ],
          )),
    );
  }
}

class CartItemContainer extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  CartProvider provider;

  CartItemContainer(
      {required this.cartItem, required this.provider, required this.index});

  Widget build(BuildContext context) {
    final TextStyle boldText = TextStyle(fontWeight: FontWeight.bold);
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfCartItemContainer = heightOfScreen / 5;
    var widthOfCartItemContainer = widthOfScreen;
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            height: heightOfScreen / 5,
            width: widthOfScreen,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: heightOfCartItemContainer,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      child: Image.asset(cartItem.image, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "  ${cartItem.itemTitle} ",
                        style: boldText,
                      ),
                      Text(
                        "  Price ${cartItem.price}",
                        style: boldText,
                      ),
                      Text(
                        "  Sub total ${cartItem.totalPrice}",
                        style: boldText,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "  Quantity: ${cartItem.quantity}",
                              style: boldText,
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      provider.subQuantity(cartItem, 1);
                                    },
                                    icon: Icon(FontAwesomeIcons.minus)),
                                Card(
                                    elevation: 2,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Center(
                                          child: Text(
                                        " ${cartItem.quantity} ",
                                        style: boldText,
                                      )),
                                    )),
                                IconButton(
                                    onPressed: () {
                                      provider.addQuantity(cartItem, 1);
                                    },
                                    icon: Icon(FontAwesomeIcons.plus))
                              ],
                            )
                          ])
                    ],
                  ),
                )
              ],
            )),
      ),
      Positioned(
        top: heightOfCartItemContainer / 2.6,
        left: widthOfCartItemContainer - 35,
        child: Container(
            width: 30,
            height: 30,
            color: Colors.amber,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.cancel, color: Colors.white),
                onPressed: () => provider.removeFromCart(cartItem),
              ),
            )),
      )
    ]);
  }
}
