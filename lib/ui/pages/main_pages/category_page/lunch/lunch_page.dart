import 'package:flutter/material.dart';
import '../../../../modules/feed_constructor.dart';

class Lunch extends StatefulWidget {
  const Lunch ({Key? key}) : super(key: key);

  @override
  _Lunch  createState() => _Lunch();
}

class _Lunch  extends State<Lunch> {
  final typeOfCategory = 2;
  final title = 'Түскі ас';
  @override
  Widget build(BuildContext context) {
    return FeedConstructor(
      type: typeOfCategory,
      title: title,
    );
  }
}

