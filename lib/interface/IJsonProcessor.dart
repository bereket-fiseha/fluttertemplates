import '../model/fruit.dart';

abstract class IJsonProcessor {
  Map<String, dynamic> getFruitObject(String fruitObject);
}
