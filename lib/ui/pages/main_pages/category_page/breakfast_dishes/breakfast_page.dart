import 'package:flutter/material.dart';
import '../../../../modules/feed_constructor.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({
    Key? key,
  }) : super(key: key);

  @override
  _BreakFast createState() => _BreakFast();
}

class _BreakFast extends State<BreakFast> {
  final title = 'Таңғы ас';
  final typeOfCategory = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  FeedConstructor(
      type: typeOfCategory,
      title: title,
    );
  }
}
