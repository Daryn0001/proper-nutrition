import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DietsCreator extends StatefulWidget {
  dynamic diets;
  DietsCreator({Key? key, required this.diets}) : super(key: key);


  @override
  _DietsCreator createState() => _DietsCreator();

}

class _DietsCreator extends State<DietsCreator>{

  var appBarBackColor = const Color(0xff35858B);
  String dietsTitle = 'Бұл тағам келесі диеталар үшін ұсынылады';


  // ? diet getter
  Widget getDiets() {
    int list = createDietButtons(widget.diets).length;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,

      ),
      child: Column(
        children: [
          getDietsText(),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: List.generate(list, (index) => (
                getDietsButton(index)
            )
            ),)

          ,
        ],
      ),
    );
  }

  Widget getDietsButton(index) {
    var listOfBtn = createDietButtons(widget.diets);
    return Container(
      child: listOfBtn[index].elementAt(0),
    );
  }


  List<Set<GestureDetector>> createDietButtons(diets){
    var appBarBackColor = const Color(0xff35858B);
    var list = List.generate(diets.length, (index) => {
      GestureDetector(
          child: Container(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.2,
              margin: const EdgeInsets.symmetric(
                  horizontal: 8,
              vertical: 8),
              color: appBarBackColor,
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
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Center(
        child: Text(
          dietsTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black26,
              fontSize: 17,
              fontWeight: FontWeight.w500

          ),
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