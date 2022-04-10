import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DietsCreator extends StatefulWidget {
  const DietsCreator({Key? key}) : super(key: key);


  @override
  _DietsCreator createState() => _DietsCreator();

}

class _DietsCreator extends State<DietsCreator>{
  var diets = [1, 3, 5, 6, 7];


  String dietsTitle = 'Это блюдо рекомендовано при следующих диетах ';


  // ? diet getter
  Widget getDiets() {
    List<Set<GestureDetector>> list = createDietButtons();
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,

      ),
      child: Column(
        children: [
          getDietsText(),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: List.generate(list.length, (index) => (
                getDietsButton(index)
            )
            ),)

          ,
        ],
      ),
    );
  }

  Widget getDietsButton(index) {
    var listOfBtn = createDietButtons();
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 10),
      child: listOfBtn[index].elementAt(0),
    );
  }


  List<Set<GestureDetector>> createDietButtons(){

    var list = List.generate(diets.length, (index) => {
      GestureDetector(
          child: Container(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.2,
              margin: const EdgeInsets.symmetric(
                  horizontal: 8),
              color: const Color(0xff006f2b),
              child: Center(
                child: Text('Стол №${diets[index]}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),),
              )
          )
      ),
    }

    );
    return list;
  }

  // ? diets text getter
  Widget getDietsText() {
    return Center(
      child: Text(
        dietsTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500

        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: getDiets(),
    );
  }
}