import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../builders/dish_detail_page/dish_detail_page_builder.dart';
import '../../builders/feed_builder.dart';
import '../../builders/inner_feed_page/search_widget.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  Widget buildSearch() => SearchWidget(
    text: '',
    hintText: 'Іздеу',
    onChanged: searchObject ,
  );

  void searchObject(String query) {}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff006f2b),
        title: const Text('Таңдаулылар',
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
            getList(context),
          ],
        ),
      ),
    );
  }



  Widget getList(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('feed')
              .snapshots(includeMetadataChanges: true),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData) {
              print('db is empty');
              return getText();
            }
            if (snapshot.hasError) {
              return const Center(child:  Text('Something went wrong'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  print('snapshot.data?.docs.length ${snapshot.data?.docs.length}');
                  var data = snapshot.data!.docs[index];

                  return FeedBuilder(
                    backgroundImg: data.get('imgPath'),
                    text: data.get('title'),
                    routePage: DishDetailPageBuilder(
                      title: data.get('title'),
                      numberOfCalories: data.get('numberOfCalories:') ,
                      diets: (data.get('diets') as List<dynamic>).map((e) => e as int).toList(),
                      adviceText: data.get('adviceText'),
                      imgPath: data.get('imgPath'),
                      cookMethod: (data.get('cookMethod') as List<dynamic>).map((e) => e as String).toList(),
                      ingredients: Map<String, String>.from(data.get("ingredients")),
                      briefDescription: data.get('briefDescription'),
                      isFavorite: data.get('favorite'),
                    ),
                  );

                }
            );
          }
      ),
    );
  }

  Widget getText(){
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 18.0, vertical: 28.0),
      child:  Center(
        child:  Text(
          'Тізім әлі бос, \n мұнда бір нәрсе қосыңыз',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            color: Colors.white38,
          ),
        ),
      ),
    );
  }


}
