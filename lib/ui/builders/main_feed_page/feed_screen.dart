
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../feed_builder.dart';

class FeedPageBuilder extends StatefulWidget {
  final List<dynamic> listOfFeeds;

  const FeedPageBuilder({Key? key, required this.listOfFeeds}) : super(key: key);

  @override
  _FeedPageBuilderState createState() => _FeedPageBuilderState();
}

class _FeedPageBuilderState extends State<FeedPageBuilder> {
  static String obet = 'https://wallpaperaccess.com/full/3759075.jpg';



  List<dynamic> exampleList = [
     FeedBuilder(
      backgroundImg: obet,
      text: 'завтрак',
    ),
    FeedBuilder(
      backgroundImg: obet,text: 'Обед',
    ),
     FeedBuilder(
      backgroundImg: obet,
      text: 'Ужин',
    ),
     FeedBuilder(
      backgroundImg: obet,
      text: 'Перекус вечерний',
    ),
  ];

  @override
  void initState() {
    super.initState();
    if(widget.listOfFeeds.isNotEmpty && widget.listOfFeeds.length > 1)
      {
        exampleList = widget.listOfFeeds;
      }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: exampleList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: exampleList[index],
          );
        });
  }
}
