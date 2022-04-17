import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/category_page/category_screen.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/diets_page/diets_screen.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/facts_page/facts_screen.dart';
import 'package:proper_nutrition_app/ui/pages/main_pages/recipes_page/recipes_screen.dart';
import 'ui/drawer/our_drawer.dart';
import 'ui/modules/feed_constructor.dart';


Future main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
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


class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    FeedConstructor.dietType = 0;
    super.initState();
  }


  final List<Tab> tabs = <Tab>[
    const Tab(child: RecipesScreen(), icon: Icon(Icons.local_dining)),
    const Tab(
        child: CategoryScreen(dietType: 0),
         icon:  Icon(Icons.format_list_bulleted_outlined)),
    const Tab(
      child: DietsScreen(),
      icon: Icon(Icons.spa),
    ),
    const Tab(child: FactsScreen(), icon: Icon(Icons.import_contacts)),
  ];

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
var appBarBackColor = const Color(0xff35858B);
var tabBarColor = const Color(0xff4FBDBA);
    return DefaultTabController(
      length: 4,
      child: Scaffold(

        drawer: const OurDrawer(),
        appBar: AppBar(
         backgroundColor: appBarBackColor,
          title: const Text('Дұрыс тамақтану',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: tabBarColor,
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
