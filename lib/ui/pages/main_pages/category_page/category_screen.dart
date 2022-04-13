import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proper_nutrition_app/ui/builders/main_feed_page/feed_screen.dart';

import '../../../../category/category.dart';
import '../../../builders/inner_feed_page/feed_screen_with_search_builder.dart';
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

      categoryFeeds = categories.isNotEmpty ? feedBuild() : [];
    });
  }

  List<CategoryFeedBuilder> feedBuild() {
    categoryFeeds = [];

    for (Category feed in categories) {
      StatefulWidget instance;
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
          default: instance = const FeedPageBuilderWithSearch(listOfFeeds: []);
      }
      categoryFeeds.add(CategoryFeedBuilder(
        categoryFeedBackgroundImg: feed.imgUrl,
        categoryTitle: feed.title,
        routePage: instance,
      ));
    }

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


