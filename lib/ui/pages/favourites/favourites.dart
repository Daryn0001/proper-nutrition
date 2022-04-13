import 'package:flutter/material.dart';

import '../../builders/inner_feed_page/search_widget.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {



  Widget buildSearch() => SearchWidget(
    text: '',
    hintText: 'Поиск',
    onChanged: searchObject ,
  );

  void searchObject(String query) {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff006f2b),
        title: const Text('Избранное',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      body: Container(
        color: const Color(0xff1e1e1e),
        child: Flex(
          direction: Axis.vertical,
          children: [
            buildSearch(),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0, vertical: 28.0),
              child:  Center(
                child:  Text(
                    'Список пока пуст, добавьте \n что-то сюда',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white38,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
