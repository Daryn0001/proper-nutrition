import 'package:flutter/material.dart';
import '../../../../modules/feed_constructor.dart';

class EveningSnack extends StatefulWidget {
  const EveningSnack({Key? key}) : super(key: key);

  @override
  _EveningSnackState createState() => _EveningSnackState();
}

class _EveningSnackState extends State<EveningSnack> {
  final typeOfCategory = 3;
  final title = 'Кешкі тіскебасар';
  @override
  Widget build(BuildContext context) {
    return FeedConstructor(
      type: typeOfCategory,
      title: title,
    );
  }
}



