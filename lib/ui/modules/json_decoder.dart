import 'dart:convert';
import 'package:flutter/services.dart';
import '../dishes/dish.dart';

class JSONDecoder {
  List<Dish> dishes = [];


  List<Dish> getDishes(String pathToJson) {
    decode(pathToJson);
    print("from getter decode: ${dishes.length}");
    if(dishes.isNotEmpty) {
      return dishes;
    }
    return [];
  }

  Future<void> decode(String pathToJson) async {
    //print('method - decode()');
    final String response =
        await rootBundle.loadString('assets/json/morning_snack.json');

    print('in the decode: \n**********************\n');

    final json = jsonDecode(response) as List<dynamic>;
    final dishList = json
        .map((dynamic e) => Dish.fromJson(e as Map<String, dynamic>))
        .toList();

    //print(dishList.first);
    print('succes');
    if (dishList.isNotEmpty) {
      dishes = dishList;
    }
  }
}
