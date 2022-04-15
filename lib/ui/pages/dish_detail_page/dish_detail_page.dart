import 'package:flutter/cupertino.dart';

import '../../builders/dish_detail_page/dish_detail_page_builder.dart';

class DishDetail extends DishDetailPageBuilder {
   DishDetail(
      {Key? key,
      required bool isFavorite,
      required String imgPath,
      required String title,
      required double numberOfCalories,
      required String briefDescription,
      required Map<String, String> ingredients,
      required List<int> diets,
      required String adviceText,
      required List<String> cookMethod})
      : super(
            key: key,
            isFavorite: isFavorite,
            imgPath: imgPath,
            title: title,
            numberOfCalories: numberOfCalories,
            briefDescription: briefDescription,
            ingredients: ingredients,
            diets: diets,
            adviceText: adviceText,
            cookMethod: cookMethod);
}
