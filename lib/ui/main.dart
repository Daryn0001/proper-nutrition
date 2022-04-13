
import 'package:flutter/material.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/category_page/category_feed_builder.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/category_page/category_screen.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/diets_page/diets_screen.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/facts_page/interesting_facts_screen.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/recipes_page/recipes_screen.dart';

import 'dish/example_data.dart';
import 'drawer/our_drawer.dart';


  main() {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  JsonExample js = JsonExample();
  @override
  Widget build(BuildContext context) {
    //js.decode();
    return MaterialApp(
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


List<dynamic> exampleList =const [
   CategoryFeedBuilder(
    categoryFeedBackgroundImg: 'assets/images/завтрак.jpg',
    categoryTitle: 'завтрак',
  ),
  CategoryFeedBuilder(
    categoryFeedBackgroundImg: 'assets/images/обед.jpg',
    categoryTitle: 'Обед',
  ),
  CategoryFeedBuilder(
    categoryFeedBackgroundImg: 'assets/images/Ужин.jpg',
    categoryTitle: 'Ужин',
  ),
  CategoryFeedBuilder(
    categoryFeedBackgroundImg: 'assets/images/Перекус вечерний.jpg',
    categoryTitle: 'Перекус вечерний',
  ),
];

class HomePage extends StatelessWidget {
  //BreakfastHelper h = BreakfastHelper();
  final List<Tab> tabs = <Tab>[
    const Tab(child: RecipesScreen(), icon: Icon(Icons.local_dining)),
    const Tab(
        child: CategoryScreen(),
         icon:  Icon(Icons.format_list_bulleted_outlined)),
    const Tab(
      child: DietsScreen(),
      icon: Icon(Icons.spa),
    ),
    const Tab(child: FactsScreen(), icon: Icon(Icons.import_contacts)),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabBar _tabBar = TabBar(
      indicatorColor: const Color(0xff016725),
      tabs: tabs.map((Tab tab) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: tab.icon,
            ),
            Text(tab.text ?? ''),
          ],
        );
      }).toList(),
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // TODO: for Marlen with love
        drawer: const OurDrawer(),
        appBar: AppBar(
          backgroundColor: const Color(0xff006f2b),
          title: const Text('Правильное питание',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: const Color(0xff016725),
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(
            children: tabs.map((Tab tab) {
          return Container(
            child: tab.child,
          );
        }).toList()),
      ),
    );
  }
}
