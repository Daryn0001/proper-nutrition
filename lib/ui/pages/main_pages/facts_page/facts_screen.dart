import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../facts/facts_class.dart';
import 'facts_detail_page.dart';
import 'facts_feed.dart';

class FactsScreen extends StatefulWidget{
  const FactsScreen({Key? key}) : super(key: key);

  @override
  _FactsScreenState createState() => _FactsScreenState();

}

class _FactsScreenState extends State<FactsScreen> {
  List<dynamic> feeds = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decode();
  }


  Future<void> decode() async{
    final String response =
    await rootBundle.loadString('assets/json/facts.json');

    setState(() {
      final json = jsonDecode(response) as List<dynamic>;
      final factsList = json
          .map((dynamic e) => Fact.fromJson(e as Map<String, dynamic>))
          .toList();

      if(factsList.isNotEmpty){
        feeds = feedBuild(factsList);
      }
    });

  }


  List<dynamic> feedBuild(List<Fact> facts){
    List<dynamic> _feeds = [];

    for (Fact fact in facts) {
      String imgPath = '';
      if (fact.imgUrl.startsWith('http')) {
        imgPath = fact.imgUrl;
      } else {
        imgPath = 'https://${fact.imgUrl}';
      }

      _feeds.add(
          FactsFeed(
              backgroundImg: imgPath,
              title: fact.name,
              routePage: FactsDetailPage(
                imgUrl: imgPath,
                title: fact.name,
                description: fact.description,),
          ),
      );

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
      color: const Color(0xffffffff),
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