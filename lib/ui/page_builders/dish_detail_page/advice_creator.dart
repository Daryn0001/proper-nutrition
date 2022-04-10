import 'package:flutter/cupertino.dart';

class Advice extends StatefulWidget{
  //var text = '';
  const Advice({Key? key}) : super(key: key);


  @override
  _Advice createState() => _Advice();
}

class _Advice extends State<Advice>{
  String text = 'Можно добавить любимые  овощи на авш вкус.';
  int textColor = 0xff999d9c;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Center(
        child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(textColor),
            fontSize: 16,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
    );
  }
}