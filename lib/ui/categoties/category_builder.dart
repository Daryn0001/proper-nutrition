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



  Container getBackground() {
    return Container(

      child: getText(),
    );
  }

  Container getText(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      height: MediaQuery.of(context).size.width * 0.15,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xff358c6a),
        border: Border.all(
            color: const Color(0xff000000),
            width: 1,
            style: BorderStyle.solid,
        )
      ),
      child: Center(
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 24,
            color:  Color(0xffffffff),
            fontWeight: FontWeight.w600,
          ),

        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.3;
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xff555555),
        image: DecorationImage(
          image:  AssetImage('assets/images/1306009.jpg'),
          fit: BoxFit.cover,
        ),),

      margin: const EdgeInsets.symmetric(
        vertical: 2.0 ,
      ),
      child: Center(child: getText()),
    );
  }
}
