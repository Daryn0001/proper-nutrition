import 'package:flutter/material.dart';
import '../../../../modules/feed_constructor.dart';

class MorningSnack extends StatefulWidget {
  const MorningSnack({Key? key}) : super(key: key);

  @override
  _MorningSnackState createState() => _MorningSnackState();
}

class _MorningSnackState extends State<MorningSnack> {
  final typeOfCategory = 1;
  final title = 'Таңғы тіскебасар';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FeedConstructor(
      type: typeOfCategory,
        title: title,
    );
  }
}
