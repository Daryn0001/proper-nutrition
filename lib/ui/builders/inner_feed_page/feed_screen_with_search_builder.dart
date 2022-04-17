
import 'package:flutter/material.dart';
import '../feed_builder.dart';
import 'search_widget.dart';

class FeedPageBuilderWithSearch extends StatefulWidget {
  //final List<FeedBuilder> listOfFeeds;
  final List<dynamic> listOfFeeds;
  final String title;

  const FeedPageBuilderWithSearch({Key? key, required this.title, required this.listOfFeeds}) : super(key: key);


  @override
  _FeedPageBuilderWithSearchState createState() => _FeedPageBuilderWithSearchState();
}

class _FeedPageBuilderWithSearchState extends State<FeedPageBuilderWithSearch> {
  static String obet = 'https://sun9-87.userapi.com/impf/_dJLh_5kQsRV1Wqh3TDFmbdCEB_mISY0n1_Krw/gQDmF1pL-s8.jpg?size=700x462&quality=95&sign=568b72de5e1951eae6e57cce47918560&type=album';

  String query = '';
  late List<dynamic> feeds;
  var appBarBackColor = const Color(0xff35858B);
  var tabBarColor = const Color(0xff4FBDBA);


  List<dynamic> exampleList = [
     FeedBuilder(
      backgroundImg: obet,
      text: 'Блюдо из яиц',
    ),
     FeedBuilder(
      backgroundImg: obet,
      text: 'Первые блюда',
    ),
     FeedBuilder(
      backgroundImg: obet,
      text: 'Салаты',
    ),
     FeedBuilder(
      backgroundImg: obet,
      text: 'Мясные блюда',
    ),
  ];

  @override
  void initState() {
    super.initState();

     if(widget.listOfFeeds.isNotEmpty && (widget.listOfFeeds.first is Widget)) {
       feeds = widget.listOfFeeds;
       exampleList = feeds;

    } else {
       feeds = exampleList;
    }
  }

  Widget buildSearch() => SearchWidget(
        text: '',
        hintText: 'Іздеу',
        onChanged: searchObject,
      );

  void searchObject(String query) {
    final feeds = exampleList.where((dish) {
      final titleLower = dish.text.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.feeds = feeds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: appBarBackColor,
      ),
      body: Container(
        color: Colors.white70,
        child: Flex(direction: Axis.vertical, children: [
          buildSearch(),
          Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: feeds.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    child: feeds[index],
                  );

                },
              )),
        ]),
      ),
    );
  }
}
