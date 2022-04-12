import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proper_nutrition_app/ui/builders/main_feed_page/feed_screen.dart';

import '../../../../category/category.dart';
import 'breakfast_dishes/breakfast_page.dart';
import 'category_feed_builder.dart';
import 'dinner/dinner_page.dart';
import 'evening_snack/evening_snack_page.dart';
import 'lunch/lunch_page.dart';
import 'morning_snack/morning_snack_page.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> categories = [];
  List<CategoryFeedBuilder> categoryFeeds = [];

  @override
  initState() {
    super.initState();
    decode();
  }

  Future<void> decode() async {
    final String response =
        await rootBundle.loadString('assets/json/categories.json');

    setState(() {
      final json = jsonDecode(response) as List<dynamic>;
      final list = json
          .map((dynamic e) => Category.fromJson(e as Map<String, dynamic>))
          .toList();
      categories = list;
      print('succes');
      print(categories.first);
      categoryFeeds = categories.isNotEmpty ? feedBuild() : [];
    });
  }

  List<CategoryFeedBuilder> feedBuild() {
    categoryFeeds = [];

    for (Category feed in categories) {
      var instance;
      switch (feed.type) {
        case 0:
          instance = const BreakFast();
          break;
        case 1:
          instance = const MorningSnack();
          break;
        case 2:
          instance = const Lunch();
          break;
        case 3:
          instance = const EveningSnack();
          break;
        case 4:
          instance = const Dinner();
          break;
      }
      categoryFeeds.add(CategoryFeedBuilder(
        categoryFeedBackgroundImg: feed.imgUrl,
        categoryTitle: feed.title,
        routePage: instance,
      ));
    }

    /*categoryFeeds = List.generate(
      categories.length,
      (index) => (CategoryFeedBuilder(
        categoryFeedBackgroundImg: categories[index].imgUrl,
        categoryTitle: categories[index].title,
        routePage: const BreakFast(),
      )),
    );*/
    return categoryFeeds;
  }

  @override
  Widget build(BuildContext context) {
    if (categoryFeeds.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return FeedPageBuilder(
      listOfFeeds: categoryFeeds,
    );
  }
}

class Helper {
  final List<String> titles = ['завтрак', 'Обед', 'Ужин', 'Перекус вечерний'];

  List<String> urls = [
    'https://sun9-87.userapi.com/impf/_dJLh_5kQsRV1Wqh3TDFmbdCEB_mISY0n1_Krw/gQDmF1pL-s8.jpg?size=700x462&quality=95&sign=568b72de5e1951eae6e57cce47918560&type=album',
    'https://sun9-17.userapi.com/impf/22GWmBy-RgsLt1eMRl8yHC0RKClRWztSouR2eA/MRQBWQKiD1E.jpg?size=700x467&quality=95&sign=f9fb0731a1e4b03d351b67c058510a4b&type=album',
    'https://sun9-70.userapi.com/impf/QBYbhVVA8fVKyDQrsL7GyM4kH7jtzl4maTCrKA/dM9MEcjxf04.jpg?size=700x700&quality=95&sign=38d5363fd7d238d53865996ebc8e0797&type=album',
    'https://sun9-72.userapi.com/impf/e_TTf5poSl5APIDJe71vOnGl-w0DniHjv0LGlQ/kkFVtj3ervY.jpg?size=700x467&quality=95&sign=8a7b03949ae1b538c1ce5a28cffd4f5c&type=album',
  ];

  List<dynamic> build() {
    dynamic list = List.generate(
        titles.length,
        (index) => (CategoryFeedBuilder(
              categoryFeedBackgroundImg: urls[index],
              categoryTitle: titles[index],
              routePage: const BreakFast(),
            )));
    return list;
  }
}

//'https://coolwallpapers.me/th700/2610619-salad-high-resolution-wallpaper-for-desktop-free-download.jpg',

//'https://coolwallpapers.me/th700/3058901-appetizer_breakfast_cuisine_delicious_diet_dining_dinner_dish_epicure_food_gourmet_greens_healthy_leaf_lunch_meal_nutrition_plate_rustic_salad_salt_spices_spoons_table_tasty_tomato_tomatoes_veget.jpg',
/*    'https://coolwallpapers.me/th700/3067223-cooked_cooking_delicious_dining_dinner_dish_eating_food_gourmet_gourmet-food_lunch_meal_meat_menu_party_plate_restaurant_table_white.jpg',
    'https://coolwallpapers.me/th700/3067091-appetizer_breakfast_confectionery_cooking_cuisine_delicious_dessert_diet_dish_epicure_food_healthy_meal_nutrition_nutritious_plates_table_tasty_top-view_traditional.jpg'*/
