import 'package:fluttertemplates/interface/IFileProcessor.dart';
import 'package:fluttertemplates/interface/IJsonProcessor.dart';
import 'package:fluttertemplates/utility/fileprocessor.dart';
import 'package:fluttertemplates/utility/jsonprocessor.dart';

import '../interface/Ifruitservice.dart';
import '../model/fruit.dart';

class FruitService extends IFruitService {
  late IFileProcessor fileProcessor;
  late IJsonProcessor jsonProcessor;
  FruitService() {
    fileProcessor = FileProcessor();
    jsonProcessor = JsonProcessor();
  }
  @override
  Future<List<Fruit>> getAllFruits() async {
    String listOfFruitsInJson = await fileProcessor.RetJsonFromFile();

    Map<String, dynamic> fruitsInJson =
        jsonProcessor.getFruitObject(listOfFruitsInJson);

    var listOfFruits = listOfFruitsFromJson(fruitsInJson, "fruits");
    //debugPrint(fruits.toString());
    return listOfFruits;
  }

  @override
  List<Fruit> listOfFruitsFromJson(
      Map<String, dynamic> listOfFruitsJson, String key) {
    List<Fruit> fruits = List<Fruit>.from(
        listOfFruitsJson[key].map((fruit) => Fruit.fromjson(fruit)));
    return fruits;
  }

  @override
  Future<List<Fruit>> getFruitsFilteredByTag(String tag) async {
    return (await getAllFruits())
        .where((element) => element.tag == tag)
        .toList();
  }
}
