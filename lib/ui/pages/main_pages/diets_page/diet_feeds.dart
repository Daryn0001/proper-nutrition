import 'package:flutter/material.dart';

import 'diet_detail_page.dart';

class DietFeed extends StatefulWidget {
  final int id;
  final dynamic routePage;
  final String url;
  final String title;

  const DietFeed(
      {Key? key,
        required this.id,
      required this.routePage,
      required this.url,
      required this.title})
      : super(key: key);

  @override
  _DietFeedState createState() => _DietFeedState();
}

class _DietFeedState extends State<DietFeed> {
  String url = 'https://st2.depositphotos.com/2933339/i/600/depositphotos_429876318-stock-photo-fresh-tomato-parsley-rosemary-isolated.jpg';
  //'https://images.wallpapersden.com/image/download/cosmos-galaxy-art_a2xsZmuUmZqaraWkpJRmZ21lrWxnZQ.jpg';

  //'https://cache.desktopnexus.com/thumbseg/2250/2250913-bigthumbnail.jpg';
  String title = 'Стол №1',
      description = 'Гастрит';
  var appBarBackColor = const Color(0xff35858B);
  final titleBackground = const Color(0xff35858B);
  final descriptionColor = const Color(0xff4FBDBA );

  dynamic routPage = const DietDetailPage(
    id: 0,
    excluded: '',
    moreDescription: '',
    title: 'Example #1',
    shortDescription: '',
  );


  @override
  Widget build(BuildContext context) {
    routPage = widget.routePage ?? routPage;
    double height = MediaQuery.of(context).size.height * 0.265;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => routPage));
      },
      child: Container(
        height: height,
        child: Stack(
          children: [
            Image.network(
              url,
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Center(child: getText()), getDescription()],
            ),
          ],
        ),
      ),
    );
  }

  Container getText() {
    if(widget.id != 0){
      title = 'Кесте №${widget.id}';
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      height: MediaQuery.of(context).size.width * 0.16,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: titleBackground,
          border: Border.all(
            color: const Color(0xffffffff),
            width: 1,
            style: BorderStyle.solid,
          )),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget getDescription() {
    description = widget.title.isNotEmpty ? widget.title : description;
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Center(
        child: RichText(
          text: WidgetSpan(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: descriptionColor,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
