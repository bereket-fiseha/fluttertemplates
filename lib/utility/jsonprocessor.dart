import 'dart:convert';

import 'package:fluttertemplates/interface/IJsonProcessor.dart';
import 'package:fluttertemplates/model/fruit.dart';

class JsonProcessor extends IJsonProcessor {
  @override
  Map<String, dynamic> getFruitObject(String fruitObject) =>
      jsonDecode(fruitObject);
}
