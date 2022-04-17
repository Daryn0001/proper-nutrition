import 'package:flutter/material.dart';

import 'category_screen.dart';

class CategoryPage4Drawer extends StatefulWidget {
  const CategoryPage4Drawer({Key? key}) : super(key: key);

  @override
  _CategoryPage4DrawerState createState() => _CategoryPage4DrawerState();
}

class _CategoryPage4DrawerState extends State<CategoryPage4Drawer> {
  var appBarBackColor = const Color(0xff35858B);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackColor,
        title: const Text('Тағамыңызды таңдаңыз',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      body: const CategoryScreen(dietType: 0),
    );
  }
}

