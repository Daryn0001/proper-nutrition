import 'package:flutter/material.dart';

import '../../../../builders/inner_feed_page/feed_screen_with_search_builder.dart';

class Dinner extends StatefulWidget {
  const Dinner({Key? key}) : super(key: key);

  @override
  _DinnerState createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  @override
  Widget build(BuildContext context) {
    return FeedPageBuilderWithSearch(
      listOfFeeds: [],
    );
  }
}
