import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:favorite_button/favorite_button.dart';
import 'widgets/advice_creator.dart';
import 'widgets/cook_method_creator.dart';
import 'widgets/ingredient_creator.dart';
import 'widgets/recommended_diets_creator.dart';

class DishDetailPageBuilder extends StatefulWidget {
  final String imgPath;
  final String title;
  final double numberOfCalories;
  final String briefDescription;
  final String adviceText;
  final Map<String, String> ingredients;
  final List<int> diets;
  final List<String> cookMethod;

  const DishDetailPageBuilder(
      {Key? key,
      required this.imgPath,
      required this.title,
      required this.numberOfCalories,
      required this.briefDescription,
      required this.ingredients,
      required this.diets,
      required this.adviceText,
      required this.cookMethod})
      : super(key: key);

  @override
  _DishDetailPageBuilder createState() => _DishDetailPageBuilder();
}

class _DishDetailPageBuilder extends State<DishDetailPageBuilder> {
  String dishTitle = 'unknown dish title';
  String imgPath = 'https://qazyqarta.kz/wp-content/uploads/2020/10/syrnyi-sup-s-kuricei-i-kartofelem_1590478472_10_max-1.jpg';
  //'https://p4.wallpaperbetter.com/wallpaper/641/365/125/portrait-anime-anime-girls-digital-art-artwork-hd-wallpaper-preview.jpg';
  String dishPower = '1 million ккал в 100 граммах';
  String briefDescription = 'unknown dish description';
  var cookingSteps = ['step 1', 'step 2', 'step 3', 'step 4', 'step 5'];
  var diets = [0, 0, 0, 0, 0];
  String adviceText = 'something about interesting';

  Map<String, String> ingredients = {
    'unknown1': ' unknown г.',
    'unknown2': ' unknown г.',
    'unknown3': ' unknown г.',
    'unknown4': ' unknown г.',
    'unknown5': ' unknown г. ',
  };

//https://healthyeating.printslon.com/images/zavtrak_145.png
// ? Get Image
  Widget getImage() {
    imgPath = widget.imgPath != '' ? widget.imgPath : imgPath;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image.network(
        imgPath,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }

  // ? Get Title
  Widget getTitle() {
    return Text(
      dishTitle,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff499274)),
    );
  }

  // final _content = 'dishTitle';

  // ? Share Button
  void _shareContent() {
    Share.share(dishTitle);
  }

  Widget getShareButton() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.share, color: Color(0xff353535), size: 36),
      onPressed: _shareContent,
      label: const Text(''),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(const Color(0xff1e1e1e)),
      ),
    );
  }

  // ? Favorite  Button
  // fixme: don't work yet
  Widget getFavoriteButton() {
    return Container(
      margin: const EdgeInsets.only(
        right: 2,
      ),
      child: FavoriteButton(
        valueChanged: () {},
        iconSize: 48,
        iconDisabledColor: const Color(0xff353535),
        iconColor: const Color(0xff499274),
      ),
    );
  }

// ? Dish title and 2 buttons
  Widget getTitleAndShareBtn() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          top: 5,
        ),
        // height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(),
            ),
            Flexible(flex: 7, child: Center(child: getTitle())),
            Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: getShareButton(),
                )),
            Flexible(flex: 2, child: Align(child: getFavoriteButton()))
          ],
        ),
      ),
    );
  }

// ? green box for dish power info
  Widget dishPowerInfo() {
    return Center(
      // ! backgroundColor for the power sizedBox: #046f2a
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.5,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        color: const Color(0xff046f2a),
        child: getText(),
      ),
    );
  }

// ? power info text
  Center getText() {
    return Center(
      child: Text(
        dishPower,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xffffffff),
        ),
      ),
    );
  }

// ? dish brief description getter method
  Widget getBriefDescription() {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: getBriefDescriptionText(),
    );
  }

// ? dish brief description text
  Center getBriefDescriptionText() {
    return Center(
      child: Text(
        briefDescription,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xff868686),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ? ingredients getter
  // width: MediaQuery.of(context).size.width,
  // height: MediaQuery.of(context).size.height * 0.55,
  Widget getIngredients(ingredients) {
    return Container(
      color: const Color(0xff1d2822),
      child: IngredientCreator(
        ingredients: ingredients,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    dishTitle = widget.title.isNotEmpty ? widget.title : dishTitle;

    imgPath = widget.imgPath.isNotEmpty ? widget.imgPath : imgPath;

    dishPower = widget.numberOfCalories != 0
        ? '${widget.numberOfCalories} ккал в 100 граммах'
        : dishPower;

    briefDescription = widget.briefDescription.isNotEmpty
        ? widget.briefDescription
        : briefDescription;

    ingredients = widget.ingredients.isNotEmpty &&
            widget.ingredients.keys.first.length > 1
        ? widget.ingredients
        : ingredients;

    diets = widget.diets.isNotEmpty ? widget.diets : diets;

    cookingSteps =
        widget.cookMethod.isNotEmpty ? widget.cookMethod : cookingSteps;

    adviceText = widget.adviceText.isNotEmpty ? widget.adviceText : adviceText;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff006f2b),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xff1e1e1e),
            child: Column(children: [
              getImage(),
              getTitleAndShareBtn(),
              dishPowerInfo(),
              getBriefDescription(),
              getIngredients(ingredients),
              DietsCreator(diets: diets),
              CookMethodCreator(cookingSteps: cookingSteps),
              Advice(text: adviceText),
            ]),
          ),
        ));
  }
}
