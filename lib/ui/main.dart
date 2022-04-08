import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proper_nutrition_app/ui/screens/category_screen.dart';
import 'package:proper_nutrition_app/ui/screens/diets_screen.dart';
import 'package:proper_nutrition_app/ui/screens/interesting_facts_screen.dart';
import 'package:proper_nutrition_app/ui/screens/recipes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Tab> tabs = <Tab>[
    const Tab(child: RecipesScreen(), icon: Icon(Icons.dining_outlined )),
    const Tab(
        child: CategoryScreen(),
        icon: Icon(Icons.format_list_bulleted_outlined)),
    const Tab(child: DietsScreen(), icon: Icon(Icons.filter_3)),
    const Tab(child: FactsScreen(), icon: Icon(Icons.auto_stories_outlined )),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff006f2b),
          title: const Text('Правильное питание',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          bottom: TabBar(
            tabs: tabs.map((Tab tab) {
              return Column(
                children: [
                  Container(
                    child: tab.icon,
                  ),
                  Text(tab.text ?? 'Unknown'),
                ],
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
            children: tabs.map((Tab tab) {
          //final String label = tab.text!.toLowerCase();
          return Container(
            child: tab.child,
          );
        }).toList()),
      ),
    );
  }
}

/*
* final String label = tab.text.toLowerCase();
            return Center(
              child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 36),
              ),
            );
            *
            *
            *  return Center(
              child: PageView(
                children: const[
                   BlueScreen(),
                   GreenScreen(),
                   PinkScreen(),
                   RedScreen(),
                ]
              ),
            );
            * */
