import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proper_nutrition_app/ui/pages/MainPages/category_screen.dart';
import 'package:proper_nutrition_app/ui/pages/MainPages/diets_screen.dart';
import 'package:proper_nutrition_app/ui/pages/MainPages/interesting_facts_screen.dart';
import 'package:proper_nutrition_app/ui/pages/MainPages/recipes_screen.dart';
//import 'package:proper_nutrition_app/ui/drawer/our_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Tab> tabs = <Tab>[
    const Tab(child: RecipesScreen(), icon: Icon(Icons.local_dining)),
    const Tab(
        child: CategoryScreen(),
        icon: Icon(Icons.format_list_bulleted_outlined)),
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
        drawer: const Drawer(),
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
