import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../builders/dish_detail_page/dish_detail_page_builder.dart';
import '../builders/feed_builder.dart';
import '../builders/inner_feed_page/feed_screen_with_search_builder.dart';
import '../dish/dish.dart';

class FeedConstructor extends StatefulWidget {
  final int type;
  final String title;
  static int dietType = 0;
  const FeedConstructor({Key? key, required this.type, required this.title}) : super(key: key);

  @override
  _FeedConstructorState createState() => _FeedConstructorState();
}

class _FeedConstructorState extends State<FeedConstructor> {
  List<dynamic> feeds = [];
  List<Dish> dishes = [];
  final String breakfastJson = 'breakfast',
      morningSnack = 'morning_snack',
      lunch = 'lunch',
      eveningSnackJson = 'evening_snack',
      dinnerJson = 'dinner';

  @override
  void initState() {
    super.initState();
    decode(widget.type);
  }

  Future<void> decode(type) async {
    String pathToJson = '';
    switch (type) {
      case 0:
        pathToJson = breakfastJson;
        break;
      case 1:
        pathToJson = morningSnack;
        break;
      case 2:
        pathToJson = lunch;
        break;
      case 3:
        pathToJson = eveningSnackJson;
        break;
      case 4:
        pathToJson = dinnerJson;
        break;
    }


    final String response =
        await rootBundle.loadString('assets/json/$pathToJson.json');

    setState(() {
      final json = jsonDecode(response) as List<dynamic>;
      final dishList = json
          .map((dynamic e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList();


      if (dishList.isNotEmpty) {
        dishes = dishList;
        feeds = feedBuild(dishes);
      }
    });
  }

  List<dynamic> feedBuild(List<Dish> dishes) {
    List<dynamic> _feeds = [];

    for (Dish dish in dishes) {
      String imgPath = '';
      if (dish.imagePath.startsWith('http')) {
        imgPath = dish.imagePath;
      } else {
        imgPath = 'https://${dish.imagePath}';
      }
      if(FeedConstructor.dietType == 0) {
        _feeds.add(FeedBuilder(
        backgroundImg: imgPath,
        text: dish.title,
        routePage: DishDetailPageBuilder(
          isFavorite: dish.favorite,
          title: dish.title,
          numberOfCalories: dish.numberOfCalories * 1.0,
          diets: dish.dietID,
          adviceText: dish.advice,
          imgPath: imgPath,
          cookMethod: dish.cookingMethod,
          ingredients: dish.getIngredients(),
          briefDescription: dish.description,
        )
      ));
      }
      else if(FeedConstructor.dietType == 1){
        if(dish.dietID.contains(1)){
          _feeds.add(FeedBuilder(
              backgroundImg: imgPath,
              text: dish.title,
              routePage: DishDetailPageBuilder(
                isFavorite: dish.favorite,
                title: dish.title,
                numberOfCalories: dish.numberOfCalories * 1.0,
                diets: dish.dietID,
                adviceText: dish.advice,
                imgPath: imgPath,
                cookMethod: dish.cookingMethod,
                ingredients: dish.getIngredients(),
                briefDescription: dish.description,
              )
          ));
        }
      }
      else if(FeedConstructor.dietType == 2){
        if(dish.dietID.contains(2)){
          _feeds.add(FeedBuilder(
              backgroundImg: imgPath,
              text: dish.title,
              routePage: DishDetailPageBuilder(
                isFavorite: dish.favorite,
                title: dish.title,
                numberOfCalories: dish.numberOfCalories * 1.0,
                diets: dish.dietID,
                adviceText: dish.advice,
                imgPath: imgPath,
                cookMethod: dish.cookingMethod,
                ingredients: dish.getIngredients(),
                briefDescription: dish.description,
              )
          ));
        }
      }
      else if(FeedConstructor.dietType == 3){
        if(dish.dietID.contains(3)){
          _feeds.add(FeedBuilder(
              backgroundImg: imgPath,
              text: dish.title,
              routePage: DishDetailPageBuilder(
                isFavorite: dish.favorite,
                title: dish.title,
                numberOfCalories: dish.numberOfCalories * 1.0,
                diets: dish.dietID,
                adviceText: dish.advice,
                imgPath: imgPath,
                cookMethod: dish.cookingMethod,
                ingredients: dish.getIngredients(),
                briefDescription: dish.description,
              )
          ));

        }
      }
      else if(FeedConstructor.dietType == 4){
        if(dish.dietID.contains(4)){
          _feeds.add(FeedBuilder(
              backgroundImg: imgPath,
              text: dish.title,
              routePage: DishDetailPageBuilder(
                isFavorite: dish.favorite,
                title: dish.title,
                numberOfCalories: dish.numberOfCalories * 1.0,
                diets: dish.dietID,
                adviceText: dish.advice,
                imgPath: imgPath,
                cookMethod: dish.cookingMethod,
                ingredients: dish.getIngredients(),
                briefDescription: dish.description,
              )
          ));
        }
      }
      else if(FeedConstructor.dietType == 5){
        if(dish.dietID.contains(5)){
          _feeds.add(FeedBuilder(
              backgroundImg: imgPath,
              text: dish.title,
              routePage: DishDetailPageBuilder(
                isFavorite: dish.favorite,
                title: dish.title,
                numberOfCalories: dish.numberOfCalories * 1.0,
                diets: dish.dietID,
                adviceText: dish.advice,
                imgPath: imgPath,
                cookMethod: dish.cookingMethod,
                ingredients: dish.getIngredients(),
                briefDescription: dish.description,
              )
          ));
        }
      }


    }
    return _feeds;
  }

  @override
  Widget build(BuildContext context) {
    if (feeds.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return FeedPageBuilderWithSearch(
      listOfFeeds: feeds,
      title: widget.title,
    );
  }
}
