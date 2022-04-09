import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'breakfast_dish_builder.dart';
import '../../page_builders/dish_detail_page/dish_detail_page_builder.dart';

class BreakFastScreen extends StatefulWidget {
  const BreakFastScreen({Key? key}) : super(key: key);


  @override
  _BreakFast createState() => _BreakFast();
}

class _BreakFast extends State<BreakFastScreen> {

  List<BreakFastBuilder> list = [
    const BreakFastBuilder(
      backgroundImg: 'assets/images/Блюдо из яиц.jpg',
      text: 'Блюдо из яиц',
    ),
    const BreakFastBuilder(
      backgroundImg: 'assets/images/Первые блюда.jpg',
      text: 'Первые блюда',
    ),
    const BreakFastBuilder(
      backgroundImg: 'assets/images/Салаты.jpg',
      text: 'Салаты',
    ),
    const BreakFastBuilder(
      backgroundImg: 'assets/images/Мясные блюда.jpg',
      text: 'Мясные блюда',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff006f2b),
      ),
      body: Container(
        color: const Color(0xff000000),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded (
              flex: 2,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder:(context, index) {
                  return Material(
                    child: ListTile(
                        title: list[index],
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const DishDetailPageBuilder()));
                      },

                    ),
                  );
                },
              )
            ),
          ]
        ),
      ),
    );
  }

}