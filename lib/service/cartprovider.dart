import 'package:flutter/cupertino.dart';

import '../model/cartitem.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> getCartItems() => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);

    notifyListeners();
  }

  void addQuantity(CartItem item, int quantity) {
    item.quantity += quantity;
    item.totalPrice = item.quantity * item.price;
    notifyListeners();
  }

  void subQuantity(CartItem item, int quanity) {
    item.quantity -= quanity;
    item.totalPrice = quanity * item.price;
    notifyListeners();
  }

  bool itemExistsInCart(String itemTitle) =>
      _cartItems.map((i) => i.itemTitle).contains(itemTitle);
  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    debugPrint("removed");
    notifyListeners();
  }
}
