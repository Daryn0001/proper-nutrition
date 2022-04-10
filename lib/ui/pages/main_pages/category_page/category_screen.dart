import 'package:flutter/material.dart';
import 'package:proper_nutrition_app/ui/builders/main_feed_page/feed_screen.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/category_page/category_feed_builder.dart';


class CategoryScreen extends FeedPageBuilder{
  @override
  final List<dynamic> listOfFeeds;

  const CategoryScreen({Key? key,required this.listOfFeeds})
      : super(key: key, listOfFeeds: listOfFeeds);

}
