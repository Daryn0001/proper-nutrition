import 'package:flutter/material.dart';

import 'facts_detail_page.dart';

class FactsFeed extends StatefulWidget {
  final String backgroundImg;
  final String title;
  final dynamic routePage;

  const FactsFeed({Key? key,
    required this.backgroundImg,
    required this.title,
    this.routePage
  }) : super(key: key);

  @override
  _FactsFeedState createState() => _FactsFeedState();
}

class _FactsFeedState extends State<FactsFeed> {
  String url = //'https://c4.wallpaperflare.com/wallpaper/588/927/685/the-hentai-prince-and-the-stony-cat-anime-anime-girls-2d-artwork-hd-wallpaper-preview.jpg';
      'https://images4.alphacoders.com/225/thumb-1920-225566.jpg';

  String title = 'Курение вредит здаровью';
  final titleBackground = const Color(0xff245446);

  FactsDetailPage fact = const  FactsDetailPage(
    imgUrl:  'https://images4.alphacoders.com/225/thumb-1920-225566.jpg',
    description: 'description',
    title: 'title',

  );

  @override
  Widget build(BuildContext context) {
    fact = widget.routePage  ?? fact;
    title = widget.title.isNotEmpty ? widget.title : title;
    url = widget.backgroundImg.isNotEmpty ? widget.backgroundImg: url;
    double height = MediaQuery.of(context).size.height * 0.24;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => fact
        ));
      },
      child: Container(
        color: Colors.white30,
        height: height,
        margin: const EdgeInsets.only(
          top: 2.0,
        ),
        child: Stack(
          children: [
            Image.network(
              url,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Center(child: getText()),
          ],
        ),
      ),
    );
  }

  Container getText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      height: MediaQuery.of(context).size.width * 0.16,
      decoration: BoxDecoration(
          color: titleBackground,
          border: Border.all(
            color: const Color(0xff000000),
            width: 1,
            style: BorderStyle.solid,
          )),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

}
