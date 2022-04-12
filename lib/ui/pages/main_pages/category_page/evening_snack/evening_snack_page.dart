import 'package:flutter/material.dart';

import '../../../../builders/inner_feed_page/feed_screen_with_search_builder.dart';

class EveningSnack extends StatefulWidget {
  const EveningSnack({Key? key}) : super(key: key);

  @override
  _EveningSnackState createState() => _EveningSnackState();
}

class _EveningSnackState extends State<EveningSnack> {
  @override
  Widget build(BuildContext context) {
    return FeedPageBuilderWithSearch(
      listOfFeeds: [],
    );
  }
}



