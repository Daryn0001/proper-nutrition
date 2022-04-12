import 'package:flutter/material.dart';

import '../../../../builders/inner_feed_page/feed_screen_with_search_builder.dart';

class Lunch extends StatefulWidget {
  const Lunch ({Key? key}) : super(key: key);

  @override
  _Lunch  createState() => _Lunch();
}

class _Lunch  extends State<Lunch> {
  @override
  Widget build(BuildContext context) {
    return const FeedPageBuilderWithSearch(listOfFeeds: [],);
  }
}

