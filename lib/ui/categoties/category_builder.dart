import 'package:flutter/cupertino.dart';

class CategoryBuilder extends StatefulWidget {
  final Color color;
  final dynamic text;
  const CategoryBuilder( {
    Key? key,
    required this.color,
    this.text
  }) : super(key: key);



  @override
  _CategoryBuilderState createState() => _CategoryBuilderState();


}

class _CategoryBuilderState extends State<CategoryBuilder> {


  Text getText(){
    return Text("");
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.3;
    double width = MediaQuery.of(context).size.width * 0.9;
    return Container(
      height: height,
      width: width,
      color: widget.color,
      margin: const EdgeInsets.symmetric(
        vertical: 2.0 ,
      ),
      child: Center(
          child: Text(widget.text)
      ),
    );
  }
}
