import 'package:flutter/material.dart';

class FactsDetailPage extends StatefulWidget {
  final String title;
  final String imgUrl;
  final String description;

  const FactsDetailPage(
      {Key? key,
      required this.title,
      required this.imgUrl,
      required this.description})
      : super(key: key);

  @override
  _FactsDetailPage createState() => _FactsDetailPage();
}

class _FactsDetailPage extends State<FactsDetailPage> {
  String title = 'Title', imgUrl = '', description = '';
  final appBarBackColor = const Color(0xff35858B);
  @override
  Widget build(BuildContext context) {
    title = widget.title.isNotEmpty ? widget.title : title;
    imgUrl = widget.imgUrl.isNotEmpty ? widget.imgUrl : imgUrl;
    description =
        widget.description.isNotEmpty ? widget.description : description;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackColor,
        title: Text(title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(children: [
            getImage(),
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15),
              color: Colors.white70,
              child: Column(
                children: [
                  getTitle(),
                  TextGetter(text: description),
                ]
              )
            ),
          ]),
        ),
      ),
    );
  }

  Widget getImage() {
    return Container(

      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget getTitle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class TextGetter extends StatefulWidget {
  final String text;

  const TextGetter({Key? key, required this.text}) : super(key: key);

  @override
  _TextGetterState createState() => _TextGetterState();
}

class _TextGetterState extends State<TextGetter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        widget.text,
        style: const TextStyle(
          color: Colors.black38,
          fontSize: 16,
          fontFamily: "Times New Roman",
        ),
      ),
    );
  }
}
