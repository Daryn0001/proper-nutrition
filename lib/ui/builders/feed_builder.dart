import 'package:flutter/material.dart';
import 'package:proper_nutrition_app/ui/builders/dish_detail_page/dish_detail_page_builder.dart';

class FeedBuilder extends StatefulWidget {
  final dynamic backgroundImg;
  final dynamic text;
  final dynamic routePage;
   const FeedBuilder(
      {Key? key, required this.backgroundImg, required this.text, this.routePage}
      ): super(key: key);


  @override
  _BreakFastBuilder createState() => _BreakFastBuilder();
}

class _BreakFastBuilder extends State<FeedBuilder>{
  dynamic obj = const DishDetailPageBuilder(
      diets: [],
      numberOfCalories: 0,
      ingredients: {'': ''},
      briefDescription: '',
      cookMethod: [],
      imgPath: '',
      title: '',
      adviceText: '');


  Widget getImage() {
    var img = Image.network('https://healthyeating.printslon.com/images/R1.png',
        fit: BoxFit.cover, width: double.infinity);

    if (widget.backgroundImg != null) {

      img = Image.network(widget.backgroundImg,  fit: BoxFit.cover, width: double.infinity,
          );
    }
    return img;
  }

  Container getText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      height: MediaQuery.of(context).size.width * 0.14,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xff358c6a),
          border: Border.all(
            color: const Color(0xff000000),
            width: 1,
            style: BorderStyle.solid,
          )),
      child: Center(
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 24,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    obj = widget.routePage ?? obj;
    double height = MediaQuery.of(context).size.height * 0.29;
    return GestureDetector(
      child: Container(
        height: height,
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 2.0,
        ),
        child: Stack(children: [
          getImage(),
          Center(child: getText()),
        ]),
      ),
      onTap: () {Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => obj));}
    );
  }

}