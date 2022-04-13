import 'package:flutter/material.dart';
import '../../../../modules/feed_constructor.dart';

class Dinner extends StatefulWidget {
  const Dinner({Key? key}) : super(key: key);

  @override
  _DinnerState createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  final typeOfCategory = 4;
  @override
  Widget build(BuildContext context) {
    return FeedConstructor(
      type: typeOfCategory,
    );
  }
}
