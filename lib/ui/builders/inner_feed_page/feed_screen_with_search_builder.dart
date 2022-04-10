import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../feed_builder.dart';
import 'search_widget.dart';

class FeedPageBuilderWithSearch extends StatefulWidget {
  //final List<FeedBuilder> listOfFeeds;
  final dynamic listOfFeeds;

  const FeedPageBuilderWithSearch({Key? key, required this.listOfFeeds}) : super(key: key);


  @override
  _FeedPageBuilderWithSearchState createState() => _FeedPageBuilderWithSearchState();
}

class _FeedPageBuilderWithSearchState extends State<FeedPageBuilderWithSearch> {
  String query = '';
  late List<FeedBuilder> feeds;

  List<FeedBuilder> exampleList = [
    const FeedBuilder(
      backgroundImg: 'assets/images/Блюдо из яиц.jpg',
      text: 'Блюдо из яиц',
    ),
    const FeedBuilder(
      backgroundImg: 'assets/images/Первые блюда.jpg',
      text: 'Первые блюда',
    ),
    const FeedBuilder(
      backgroundImg: 'assets/images/Салаты.jpg',
      text: 'Салаты',
    ),
    const FeedBuilder(
      backgroundImg: 'assets/images/Мясные блюда.jpg',
      text: 'Мясные блюда',
    ),
  ];

  @override
  void initState() {
    super.initState();
    feeds = exampleList;
    /* if(widget.listOfFeeds.isEmpty) {
    } else {
      feeds = widget.listOfFeeds;
    }*/
  }

  Widget buildSearch() => SearchWidget(
        text: '',
        hintText: 'Поиск',
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
        backgroundColor: const Color(0xff006f2b),
      ),
      body: Container(
        color: const Color(0xff1e1e1e),
        child: Flex(direction: Axis.vertical, children: [
          buildSearch(),
          Expanded(
              flex: 2,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: feeds.length,
                itemBuilder: (context, index) {
                  return Material(
                    child: ListTile(
                      title: feeds[index],
                      onTap: () {
                      },
                    ),
                  );
                },
              )),
        ]),
      ),
    );
  }
}
