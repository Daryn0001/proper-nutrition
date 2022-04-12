
import 'package:flutter/material.dart';

import '../../../../builders/inner_feed_page/feed_screen_with_search_builder.dart';

class MorningSnack extends StatefulWidget {
  const MorningSnack({Key? key}) : super(key: key);

  @override
  _MorningSnackState createState() => _MorningSnackState();
}

class _MorningSnackState extends State<MorningSnack> {
  @override
  Widget build(BuildContext context) {
    return const FeedPageBuilderWithSearch(
      listOfFeeds: [],
    );
  }
}
