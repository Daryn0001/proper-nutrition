import 'package:flutter/material.dart';

import '../category_page/category_screen.dart';


class DietDetailPage extends StatefulWidget {
  final int id;
  final String title;
  final String shortDescription;
  final String moreDescription;
  final String excluded;

  const DietDetailPage(
      {Key? key,
      required this.title,
      required this.shortDescription,
      required this.moreDescription,
      required this.excluded,
      required this.id})
      : super(key: key);

  @override
  _DietDetailPageState createState() => _DietDetailPageState();
}

class _DietDetailPageState extends State<DietDetailPage> {
  final appBarBackground = const Color(0xff016725);
  final shortTextColor = Colors.white70;


  @override
  initState(){
    super.initState();

  }

  String shortDescription = 'short Description';
  String moreDescription = 'more Description';
  String excluded = 'excluded';
  String title = "Стол №1";
  String url =
      'https://images.wallpapersden.com/image/download/cosmos-galaxy-art_a2xsZmuUmZqaraWkpJRmZ21lrWxnZQ.jpg';

  @override
  Widget build(BuildContext context) {
    title = widget.id != 0 ? 'Стол №${widget.id}' : title;
    moreDescription = widget.moreDescription.isNotEmpty
        ? widget.moreDescription
        : moreDescription;

    excluded = widget.excluded.isNotEmpty ? widget.excluded : excluded;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: appBarBackground,
      ),
      body: SingleChildScrollView(
        child: Container(

          //height: MediaQuery.of(context).size.height,
          color: const Color(0xff1e1e1e),
          child: Column(
            children: [
              getTitle(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  //vertical: 20
                ),
                child: Column(
                  children: [
                    getBriefDescription(),
                    MoreDescriptionGetter(moreDescription: moreDescription,),
                    ExcludedGetter(excluded: excluded,),

                  ],
                ),
              ),
              DishFeedGetter(dietId: widget.id)

            ],
          ),
        ),
      ),
    );
  }

  Widget getTitle() {
    title = widget.id != 0 ? 'Стол ${widget.id}' : title;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: Stack(children: [
        Image.network(url, fit: BoxFit.cover, width: double.infinity),
        Center(
            child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
        ))
      ]),
    );
  }

  Widget getBriefDescription() {
    shortDescription = widget.shortDescription.isNotEmpty
        ? widget.shortDescription
        : shortDescription;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Text(
            shortDescription,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: shortTextColor,
            ),
          ),
        ],
      ),
    );
  }



}

class MoreDescriptionGetter extends StatefulWidget {
  final String moreDescription;
  const MoreDescriptionGetter({Key? key,required this.moreDescription}) : super(key: key);

  @override
  _MoreDescriptionGetterState createState() => _MoreDescriptionGetterState();
}

class _MoreDescriptionGetterState extends State<MoreDescriptionGetter> {
  final bigTextColor = Colors.white38;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        widget.moreDescription,
        style: TextStyle(
          color: bigTextColor,
          fontSize: 14,
        ),
      ),
    );
  }
}


class ExcludedGetter extends StatefulWidget {
  final String excluded;
  const ExcludedGetter({Key? key, required this.excluded}) : super(key: key);

  @override
  _ExcludedGetterState createState() => _ExcludedGetterState();
}

class _ExcludedGetterState extends State<ExcludedGetter> {
  final excludedTextColor = Colors.white38;

  Widget getText(text){
// ! handle the  ' - ' strings
    List<String> listOfString = text.split('');
    List<String> newList = [];

      for(int i = 0; i < listOfString.length; i ++) {
        int b = i;
        List<String> test = [];
        for(b = i; b < i + 2; b++){
          if(b == listOfString.length) break;
          test.add(listOfString[b]);

        }
        i = b-1;
        String str = test.join('');
        if(str.contains(' -')){
          newList.add('\n $str');
        }
        else if(str.contains('- ')) {
          newList.add('\n  $str');
        }
        else {
          newList.add(str);
        }


      }
      String str = newList.join('');
      str = 'Исключение из диеты:$str';

    return Text(
      str,
      style: TextStyle(
        color: excludedTextColor,
        fontSize: 14,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: getText(widget.excluded),
    );
  }
}



class DishFeedGetter extends StatefulWidget {
  final int dietId;
  const DishFeedGetter({Key? key, required this.dietId}) : super(key: key);

  @override
  _DishFeedGetterState createState() => _DishFeedGetterState();
}

class _DishFeedGetterState extends State<DishFeedGetter> {

/*
  List<Category> categories = [];
  List<CategoryFeedBuilder> categoryFeeds = [];

  // ! connect to firebase data base
  initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }




  @override
  initState() {
    super.initState();
    decode();
    initFirebase();
  }

  Future<void> decode() async {
    final String response =
    await rootBundle.loadString('assets/json/categories.json');

    setState(() {
      final json = jsonDecode(response) as List<dynamic>;
      final list = json
          .map((dynamic e) => Category.fromJson(e as Map<String, dynamic>))
          .toList();
      categories = list;

      categoryFeeds = categories.isNotEmpty ? feedBuild() : [];
    });
  }

  List<CategoryFeedBuilder> feedBuild() {
    categoryFeeds = [];

    for (Category feed in categories) {
      StatefulWidget instance;
      switch (feed.type) {
        case 0:
          instance = const BreakFast();
          break;
        case 1:
          instance = const MorningSnack();
          break;
        case 2:
          instance = const Lunch();
          break;
        case 3:
          instance = const EveningSnack();
          break;
        case 4:
          instance = const Dinner();
          break;
        default: instance = const FeedPageBuilderWithSearch(listOfFeeds: [], title: '');
      }
      categoryFeeds.add(CategoryFeedBuilder(
        categoryFeedBackgroundImg: feed.imgUrl,
        categoryTitle: feed.title,
        routePage: instance,
      ));
    }

    return categoryFeeds;
  }

*/

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        CategoryScreen(dietType: widget.dietId,),
      ],
    );
  }
}

