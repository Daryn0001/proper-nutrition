import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_screen.dart';

class CategoryPage4Drawer extends StatefulWidget {
  const CategoryPage4Drawer({Key? key}) : super(key: key);

  @override
  _CategoryPage4DrawerState createState() => _CategoryPage4DrawerState();
}

class _CategoryPage4DrawerState extends State<CategoryPage4Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff006f2b),
        title: const Text('Выберите свое блюдо',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      body: const CategoryScreen(),
    );
  }
}

