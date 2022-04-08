import 'package:flutter/material.dart';
import 'package:proper_nutrition_app/ui/categoties/category_builder.dart';
import 'package:proper_nutrition_app/ui/screens/breakfast_dishes/breakfast_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  AssetImage getImage(String path) => AssetImage(path);
//'assets/images/завтрак.jpg'
  List<CategoryBuilder> list = [
    const CategoryBuilder(
      backgroundImg: 'assets/images/завтрак.jpg',
      text: 'завтрак',
    ),
    const CategoryBuilder(
      backgroundImg: 'assets/images/обед.jpg',
      text: 'Обед',
    ),
    const CategoryBuilder(
      backgroundImg: 'assets/images/Ужин.jpg',
      text: 'Ужин',
    ),
    const CategoryBuilder(
      backgroundImg: 'assets/images/Перекус вечерний.jpg',
      text: 'Перекус вечерний',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff000000),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: list[index],
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const BreakFastScreen()));
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
