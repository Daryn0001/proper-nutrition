import 'package:flutter/cupertino.dart';
import 'package:proper_nutrition_app/ui/builders/inner_feed_page/feed_screen_with_search_builder.dart';
import 'package:proper_nutrition_app/ui/builders/feed_builder.dart';


class CategoryFeedBuilder extends FeedBuilder {
  final dynamic categoryFeedBackgroundImg;
  final dynamic categoryTitle;
  final dynamic routePage;

  const CategoryFeedBuilder(
      {Key? key,
      this.categoryFeedBackgroundImg,
      this.categoryTitle,
      this.routePage})
      : super(
            key: key,
            backgroundImg: categoryFeedBackgroundImg,
            text: categoryTitle,
            routePage: routePage);
}
