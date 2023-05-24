import 'package:flutter/material.dart';

class Fruit {
  String tag;
  String imageSrc;
  String fruitName;
  String? description;
  String price;
  bool fav;
  List<String> healthBenefits;
  List<String> allImages;
  Fruit({
    this.tag = "",
    required this.fav,
    this.description,
    required this.fruitName,
    required this.imageSrc,
    required this.price,
    this.healthBenefits = const [],
    this.allImages = const [],
  });

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "fav": fav,
        "fruitName": fruitName,
        "imageSrc": imageSrc,
        "price": price,
        "description": description,
        "healthBenefits": healthBenefits,
        "allImages": allImages,
      };
  factory Fruit.fromjson(Map<String, dynamic> fruitJson) {
    debugPrint(fruitJson.toString());
    return Fruit(
        tag: fruitJson["tag"],
        fav: fruitJson["fav"],
        fruitName: fruitJson["fruitName"],
        imageSrc: fruitJson["imageSrc"],
        price: fruitJson["price"],
        description: fruitJson["description"].toString(),
        allImages:
            List<String>.from(fruitJson["allImages"].map((x) => x.toString())),
        healthBenefits: List<String>.from(
            fruitJson["healthBenefits"].map((x) => x.toString())));
  }
}
