import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:favorite_button/favorite_button.dart';
import 'advice_creator.dart';
import 'cook_method_creator.dart';
import 'ingredient_creator.dart';
import 'recommended_diets_creator.dart';

class DishDetailPageBuilder extends StatefulWidget {
   dynamic imgPath;
   dynamic title;
   dynamic numberOfCalories;
   dynamic briefDescription;
   Map<String, String> ingredients;
   List<int> diets;
   List<String> cookMethod;

  //var power;
  // var briefDescription;

   DishDetailPageBuilder(
      {Key? key,
      this.imgPath,
      this.title,
      required this.numberOfCalories,
      required this.briefDescription,
      required this.ingredients,
      required this.diets,
      required this.cookMethod})
      : super(key: key);

  @override
  _DishDetailPageBuilder createState() => _DishDetailPageBuilder();
}

class _DishDetailPageBuilder extends State<DishDetailPageBuilder> {
  String dishTitle = 'unknown dish title';
  String path = 'assets/images/Блины, оладьи.jpg';
  String dishPower = '1 million ккал в 100 граммах';
  String briefDescription = 'unknown dish description';
  var cookingSteps = ['step 1', 'step 2', 'step 3', 'step 4', 'step 5'];
  var diets = [0, 0, 0, 0, 0];

  Map<String, String> ingredients = {
    'unknown1': ' unknown г.',
    'unknown2': ' unknown г.',
    'unknown3': ' unknown г.',
    'unknown4': ' unknown г.',
    'unknown5': ' unknown г. ',
  };


// ? Get Image
  Widget getImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image.asset(
        path,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
    );
  }

  // ? Get Title
  Widget getTitle() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Center(
        child: Text(
          dishTitle,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff499274)),
        ),
      ),
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
  // fixme: this button has bad style and don't work yet
  Widget getFavoriteButton() {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
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
// ! title color:  499274
    return Align(
      alignment: Alignment.centerRight,
      widthFactor: 1,
      child: Container(
        margin: const EdgeInsets.only(
          top: 5,
          left: 55,
        ),
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [getTitle(), getShareButton(), getFavoriteButton()],
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
  Widget getIngredients(ingredients) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.55,
      child: Container(
        color: const Color(0xff1d2822),
        child: IngredientCreator(ingredients: ingredients,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
      dishTitle = widget.title != '' ? widget.title : dishTitle;

      path = widget.imgPath != '' ? widget.imgPath : path;

      dishPower =  widget.numberOfCalories != 0 ?  '${widget.numberOfCalories} ккал в 100 граммах' : dishPower;

      briefDescription = widget.briefDescription != '' ? widget.briefDescription : briefDescription;

      ingredients = widget.ingredients.isNotEmpty  ? widget.ingredients : ingredients;

      diets = widget.diets.isNotEmpty ? widget.diets : diets;

      cookingSteps = widget.cookMethod.isNotEmpty ? widget.cookMethod : cookingSteps;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff006f2b),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xff1e1e1e),
            child: Stack(
              children: <Widget>[
                Column(children: [
                  getImage(),
                  getTitleAndShareBtn(),
                  dishPowerInfo(),
                  getBriefDescription(),
                  getIngredients(ingredients),
                  DietsCreator(diets: diets),
                  CookMethodCreator(cookingSteps: cookingSteps),
                  const Advice(),
                ]),
              ],
            ),
          ),
        ));
  }
}
