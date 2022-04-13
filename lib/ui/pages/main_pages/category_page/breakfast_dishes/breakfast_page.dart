import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../../builders/dish_detail_page/dish_detail_page_builder.dart';
import '../../../../builders/feed_builder.dart';
import '../../../../builders/inner_feed_page/feed_screen_with_search_builder.dart';
import '../../../../dishes/dish.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({
    Key? key,
  }) : super(key: key);

  @override
  _BreakFast createState() => _BreakFast();
}

class _BreakFast extends State<BreakFast> {
  List<Dish> dishes = [];
  List<dynamic> feeds = [];

  @override
  void initState() {
    super.initState();
    decode();
    feedBuild();
  }

  List<dynamic> feedBuild() {
    feeds = [];
    //print('BEGINNING - ${dishes.length} \n*******************************');

    for(Dish dish in dishes){
      String imgPath = '';
      if(dish.imagePath.startsWith('https://')){
        imgPath = dish.imagePath;
      }
      else{
        imgPath = 'https://${dish.imagePath}';
        print('imgPath: $imgPath');
      }

      feeds.add(
          FeedBuilder(
            backgroundImg: imgPath,
            text: dish.title,
            routePage: DishDetailPageBuilder(
              title: dish.title,
              numberOfCalories: dish.numberOfCalories * 1.0,
              diets: dish.dietID,
              adviceText: dish.advice,
              imgPath: imgPath,
              cookMethod: dish.cookingMethod,
              ingredients: dish.getIngredients(),
              briefDescription: dish.description,
            ),
          )
      );

    }
    return feeds;
  }

  Future<void> decode() async {
    //print('method - decode()');
    final String response =
        await rootBundle.loadString('assets/json/breakfast.json');
    setState(() {
      final json = jsonDecode(response) as List<dynamic>;
      final dishList = json
          .map((dynamic e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList();
      dishes = dishList;
      //print(dishList.first);
      //print('succes');
      if (dishes.length > 1) {
        feeds = feedBuild();
      }
    });
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
    );
  }
}
