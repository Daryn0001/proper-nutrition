import 'package:flutter/material.dart';
import 'package:proper_nutrition_app/ui/categoties/category_builder.dart';

class CategoryScreen extends StatefulWidget{
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();

}

class _CategoryScreenState extends State<CategoryScreen> {

   List<CategoryBuilder> list = [const CategoryBuilder(color: Color(0xffda2c02), text: 'завтрак',),
     const CategoryBuilder(color: Color(0xff94dd16), text: 'Обед',),
     const CategoryBuilder(color: Color(0xff6880e6), text: 'Ужин',),
     const CategoryBuilder(color: Color(0xffdf1ca4), text: 'Дополнение',),
   ];

  @override
  Widget build(BuildContext context) {
    return  Expanded (
      child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: const [
             CategoryBuilder(color: Color(0xffda2c02), text: 'завтрак',),
             CategoryBuilder(color: Color(0xff94dd16), text: 'Обед',),
             CategoryBuilder(color: Color(0xff6880e6), text: 'Ужин',),
             CategoryBuilder(color: Color(0xffdf1ca4), text: 'Дополнение',)
          ]
      ),
    );
  }

}