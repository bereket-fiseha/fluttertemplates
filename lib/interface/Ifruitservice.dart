import '../model/fruit.dart';

abstract class IFruitService {
  Future<List<Fruit>> getAllFruits();
  Future<List<Fruit>> getFruitsFilteredByTag(String tag);
}
