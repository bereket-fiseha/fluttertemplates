import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fluttertemplates/interface/IFileProcessor.dart';

class FileProcessor extends IFileProcessor {
  List<Map<String, dynamic>> listOfFruitsInJson = [
    {
      "tag": "mango",
      "fav": false,
      "fruitName": "Mango",
      "imageSrc": "assets/images/mango2.png",
      "price": "44",
      "description": "description",
      "healthBenefits": ["is good for health"]
    },
    {
      "tag": "banana",
      "fav": true,
      "fruitName": "Banana",
      "imageSrc": "assets/images/bananas.png",
      "price": "35",
      "description": "this is the description",
      "healthBenefits": ["it is good for hair", "it is good for eye"]
    },
    {
      "tag": "apple",
      "fav": false,
      "fruitName": "Apple",
      "imageSrc": "assets/images/more apple.png",
      "price": "44",
      "description": "description",
      "healthBenefits": ["is good for health"]
    }
  ];
  @override
  Future<String> RetJsonFromFile() async {
    // TODO: implement RetJsonFromFile

    final String response =
        await rootBundle.loadString('assets/data/fruitdata.json');

    return response;
  }
}
