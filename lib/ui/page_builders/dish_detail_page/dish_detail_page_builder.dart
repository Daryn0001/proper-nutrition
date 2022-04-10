import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'advice_creator.dart';
import 'cook_method_creator.dart';
import 'ingredient_creator.dart';
import 'recommended_diets_creator.dart';

class DishDetailPageBuilder extends StatefulWidget {
  //var power;
  // var briefDescription;

  const DishDetailPageBuilder({Key? key}) : super(key: key);

  @override
  _DishDetail createState() => _DishDetail();
}

class _DishDetail extends State<DishDetailPageBuilder> {
  //power = 161.1;
  String dishPower = '161.1 ккал в 100 граммах';
  String briefDescription = 'Простой и быстрый завтрак';

  var diets = [1, 3, 5, 6, 7];

// ? Get Image
  Widget getImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image.asset('assets/images/Блины, оладьи.jpg',
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,

      ),
    );
  }
  // ? Get Title
  Widget getTitle() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: const Text('Омлет с овощами',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff499274)
        ),
      ),
    );
  }

  final _content = 'dsad';


  // ? Share Button
  void _shareContent() {
    Share.share(_content);
  }

  Widget getShareButton() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.share),
      onPressed: _shareContent,
      label: const Text(''),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
    );
  }


  // ? Favorite  Button
  // fixme: this button has bad style and don't work yet
  Widget getFavoriteButton(){
    return ElevatedButton.icon(
      icon: const Icon(Icons.favorite_outlined, color: Color(0xff1e1e1e)),
      onPressed: (){},
      label: const Text(''),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 2, color: Colors.transparent),
        backgroundColor: Colors.transparent,
        primary: Theme.of(context).primaryColorDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
        ),
      ),

    );
  }

// ? Dish title and 2 buttons
  Widget getTitleAndShareBtn(){
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
          children:  [
            getTitle(),
            getShareButton(),
            getFavoriteButton()
          ],
        ),
      ),
    );

  }

// ? green box for dish power info
  Widget dishPowerInfo (){

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
  Center getText(){
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
  Widget getBriefDescription(){
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: getBriefDescriptionText(),
    );
  }

// ? dish brief description text
  Center getBriefDescriptionText(){
    return  Center(
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
  Widget getIngredients () {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.55,
      child: Container(
        color: const Color(0xff1d2822),
        child: const IngredientCreator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff006f2b),
      ),

      body: SingleChildScrollView(

        child: Container(
          color: const Color(0xff1e1e1e),
          child: Stack(
            children:
              <Widget> [
                Column(
                  children:[
                    getImage(),
                    getTitleAndShareBtn(),
                    dishPowerInfo(),
                    getBriefDescription(),
                    getIngredients(),
                    const DietsCreator(),
                    const CookMethodCreator(),
                    const Advice(),
                  ]
                ),

              ],

          ),
        ),

      )
    );
  }

}