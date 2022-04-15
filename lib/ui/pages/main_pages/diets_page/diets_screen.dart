import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../dieta/diet.dart';
import 'diet_detail_page.dart';
import 'diet_feeds.dart';

class DietsScreen extends StatefulWidget {
  const DietsScreen({Key? key}) : super(key: key);

  @override
  _DietsScreenState createState() => _DietsScreenState();
}

class _DietsScreenState extends State<DietsScreen> {
  List<Diet> diets = [];
  List<dynamic> feeds = [];

  @override
  void initState() {
    super.initState();
    decode();
  }

/*  List<dynamic> exampleList = [
    const DietFeed(),
    const DietFeed(),
    const DietFeed(),
    const DietFeed(),
    const DietFeed(),
  ];*/

  Future<void> decode() async {
    final String response = await rootBundle.loadString('assets/json/dieta.json');
    //print('from decode after response');
    setState(() {
      //print('from setState');
      final json = jsonDecode(response) as List<dynamic>;
      final dietsList = json
          .map((dynamic e) => Diet.fromJson(e as Map<String, dynamic>))
          .toList();

      if (dietsList.isNotEmpty) {
        diets = dietsList;
       // print("diets: \n ${diets.first}");
        feeds = feedBuild(diets);
      }
    });
  }

  String backgroundImg =
      'https://images.wallpapersden.com/image/download/cosmos-galaxy-art_a2xsZmuUmZqaraWkpJRmZ21lrWxnZQ.jpg';

  List<dynamic> feedBuild(List<Diet> diets) {
   // print('from feedBuild');
    List<dynamic> _feeds = [];

    for (Diet d in diets) {

      if(d.id == 2) {
        print('from screen\n');
        print(d.excluded.length);
      }
      _feeds.add(DietFeed(
        id: d.id,
        url: backgroundImg,
        title: d.name,
        routePage: DietDetailPage(
          id: d.id,
          moreDescription: d.moreDescription,
          excluded: d.excluded,
          shortDescription: d.shortDescription,
          title: d.name,
        ),
      ));
    }

    return _feeds;
  }

  @override
  Widget build(BuildContext context) {
    if (feeds.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      color: const Color(0xff000000),
      child: Flex(
        direction: Axis.vertical,
        children: [
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
                }),
          ),
        ],
      ),
    );
  }
}
