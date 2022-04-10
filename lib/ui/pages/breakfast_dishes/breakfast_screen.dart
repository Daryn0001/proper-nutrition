import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'breakfast_dish_builder.dart';
//import '../../page_builders/dish_detail_page/dish_detail_page_builder.dart';
import 'search_widget.dart';

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
  void initState() {
    super.initState();
    dishes = list;
  }

  String query = '';
  late List<BreakFastBuilder> dishes;

  Widget buildSearch() => SearchWidget(
    text: '',
    hintText: 'Поиск',
    onChanged: searchObject,
  );

  void searchObject(String query){
    final dishes = list.where((dish) {
      final titleLower = dish.text.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    } ).toList();

    setState(() {
      this.query = query;
      this.dishes = dishes;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff006f2b),
      ),
      body: Container(
        color: const Color(0xff1e1e1e),
        child: Flex(
          direction: Axis.vertical,
          children: [
            buildSearch(),
            Expanded (
              flex: 2,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dishes.length,
                itemBuilder:(context, index) {
                  return Material(
                    child: ListTile(
                        title: dishes[index],
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => DishDetailPageBuilder()));
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