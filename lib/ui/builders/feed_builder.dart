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
  dynamic obj = DishDetailPageBuilder(
      isFavorite: false,
      diets: [],
      numberOfCalories: 0,
      ingredients: {'': ''},
      briefDescription: '',
      cookMethod: [],
      imgPath: '',
      title: '',
      adviceText: '');


  Widget getImage(context) {
    var img = Image.network('https://wallpaperaccess.com/full/3759075.jpg',
        fit: BoxFit.cover, width: double.infinity);

    if (widget.backgroundImg != null) {
      img = Image.network(
        widget.backgroundImg,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,);
    }
    return img;
  }
  //const Color(0xff358c6a)\
  //0xff35858B  0xff54BAB9   35858B
  //B2F9FC  /4FBDBA
var backColor4Title = const Color(0xff35858B);
  Container getText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      height: MediaQuery.of(context).size.width * 0.16,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: backColor4Title,
          border: Border.all(
            color: const Color(0xffffffff),
            width: 1,
            style: BorderStyle.solid,
          )),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical:10,
        ),
        child: Center(
          child: Text(
            widget.text,
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

  @override
  Widget build(BuildContext context) {
    obj = widget.routePage ?? obj;
    double height = MediaQuery.of(context).size.height * 0.29;
    return GestureDetector(
      child: Container(
        height: height,
        width: double.infinity,
        child: Stack(children: [
          getImage(context),
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