import 'dart:ffi';

import 'package:fluttertemplates/model/enum.dart';

class CartItem {
  final String itemId;
  final String itemTitle;
  final ItemCategory itemCategory;
  final String image;
  final double price;
  int quantity;
  double totalPrice;
  final String userId;
  final DateTime date = DateTime.now();

  CartItem(
      {required this.itemId,
      required this.itemTitle,
      required this.image,
      required this.quantity,
      required this.itemCategory,
      required this.price,
      required this.userId})
      : totalPrice = price * quantity;
}
