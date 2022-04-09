import 'package:flutter/cupertino.dart';

class CategoryBuilder extends StatefulWidget {
  final dynamic backgroundImg;
  final dynamic text;

  const CategoryBuilder({Key? key, required this.backgroundImg, this.text})
      : super(key: key);

  @override
  _CategoryBuilderState createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  DecorationImage getImage() {
    var img = const AssetImage('assets/images/1306009.jpg');

    if (widget.backgroundImg != null) {
      img = AssetImage(widget.backgroundImg);
    }

    return DecorationImage(
      image: img,
      fit: BoxFit.cover,
    );
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
    double height = MediaQuery.of(context).size.height * 0.33;
    double width = MediaQuery.of(context).size.width * 1;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xff555555),
        image: DecorationImage(
          image: AssetImage(widget.backgroundImg),
            fit: BoxFit.cover
        ),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: Center(child: getText()),
    );
  }
}
