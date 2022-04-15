import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../favourites/favourites.dart';
import '../../shopping_list/shopping_list_page.dart';
import '../category_page/category_page_for_drawer.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  int activeIndex4TopSlider = 0, activeIndex4NewsSlider = 0;
  final imageUrls4TopSlider = [
    'https://wallpaperaccess.com/full/1278234.jpg',
    'https://wallpapercave.com/wp/wp3138446.jpg',

    'https://healthyeating.printslon.com/images/R50.png',
    'https://img4.goodfon.com/wallpaper/nbig/c/e1/klubnika-smorodina-frukty-malina-iagody-salat-dessert-fruit.jpg',
  ];

  final imgUrls4NewsSlider = [
    'https://healthyeating.printslon.com/images/R68.png',
    'https://healthyeating.printslon.com/images/obed_255.png',
    'https://healthyeating.printslon.com/images/r_recept_29_ng.png',
    'https://healthyeating.printslon.com/images/r_recept_7_ng.png',
    'https://hips.hearstapps.com/delish/assets/17/26/1498854508-delish-mimosa-fruit-salad-3.jpg',
  ];

  String testUrl1 = 'https://img5.goodfon.ru/wallpaper/nbig/9/21/girl-anime-wallpapers-anime-girl.jpg';
  String testUrl2 = 'https://www.pixel4k.com/wp-content/uploads/2018/03/Strawberry%20Water%20Splash5154818736.jpg';
  String testUrl3 = 'https://wallpaperaccess.com/full/2329942.jpg';


  @override
  Widget build(BuildContext context) {
    final gridWidgets = <Widget>[
      slideBuilder(imgUrls4NewsSlider, 'Жаңа'),
    buildImage(testUrl1, 0, 'Күннің рецебі', 130.0, 50.0, 16.0),
    buildImage(testUrl2, 0, 'Сатып алу тізімі', 130.0, 50.0, 16.0, routePage: const ShoppingList()),
    buildImage(testUrl3, 0, 'Таңдаулылар', 130.0, 50.0, 16.0, routePage: const FavouritesPage()),

    ];
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xff1e1e1e),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.329,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                    width: double.infinity,
                    color: Colors.grey,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.308,
                      child: Stack(children: [
                        CarouselSlider.builder(
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height,
                              autoPlay: true,
                              autoPlayInterval:
                                  const Duration(seconds: 3),
                              viewportFraction: 1,
                              onPageChanged: (index, reason) => setState(
                                  () => activeIndex4TopSlider = index),
                            ),
                            itemCount: imageUrls4TopSlider.length,
                            itemBuilder: (context, index, realIndex) {
                              final imgUrl = imageUrls4TopSlider[index];
                              return GestureDetector(
                                onTap: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const CategoryPage4Drawer()));},
                                child: buildImage(imgUrl, index, 'Барлық рецепттерді қарау',
                                    (MediaQuery.of(context).size.width * 0.7),
                                    (MediaQuery.of(context).size.width * 0.2), 20.0),
                              );
                            }),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: buildIndicator(
                                    activeIndex4TopSlider)))
                      ]),
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView.builder(
                  itemCount: gridWidgets.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return gridWidgets[index];
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(imgUrl, index, title, w, h, fz, {routePage}) {
    routePage ??= const CategoryPage4Drawer();
    return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => routePage));
    },
    child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 1,
        ),
        color: Colors.grey,
        child: Stack(
          children: [
            Image.network(
            imgUrl,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
          ),
            getTitle(title,w, h, fz),

      ],
        )),
  );
  }

  Widget buildIndicator(activeIndex, {count = 5}) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: count,
        effect: const JumpingDotEffect(
          paintStyle: PaintingStyle.stroke,
          dotWidth: 13,
          dotHeight: 13,
          strokeWidth: 1,
          dotColor: Colors.black,
          activeDotColor: Colors.black54,
        ),
      );

  Widget slideBuilder(imgUrls, title) => Stack(
      children: [
    CarouselSlider.builder(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          viewportFraction: 1,
          onPageChanged: (index, reason) =>
              setState(() => activeIndex4NewsSlider = index),
        ),
        itemCount: imgUrls.length,
        itemBuilder: (context, index, realIndex) {
          final imgUrl = imgUrls[index];
          return buildImage(imgUrl, index, title, 130.0, 50.0, 16.0);
        }),
    Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2),
            child:
                buildIndicator(activeIndex4NewsSlider, count: imgUrls.length)))
  ]);

  Widget getTitle(title, width, height, fontSize) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xff358c6a),
            border: Border.all(
              color: const Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal:10),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }


}

