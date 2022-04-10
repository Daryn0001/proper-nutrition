import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IngredientCreator extends StatefulWidget {
  const IngredientCreator({
    Key? key,
  }) : super(key: key);


  @override
  _IngredientCreator createState() => _IngredientCreator();
}

class _IngredientCreator extends State<IngredientCreator> {


  String title = 'Ингредиенты';
  Map<String, String> ingredients = {
    'Яйцо': ' 2 шт.',
    'Помидор': ' 30 г.',
    'Перец сладки': ' 50 г.',
    'Оливковое масло': ' 5 г.',
    'Соль': ' по вкусу ',
  };

  // ? Ingredient

  Widget getIngredient(index){
    var list = createIngredientTextList();
    return list[index].elementAt(0);
  }


  List<Set<IngredientGetter>> createIngredientTextList() {
    List<String> nameOfIngredient = ingredients.keys.toList();
    List<String> quantity = ingredients.values.toList();
    var listOfIngredient = List.generate(
        nameOfIngredient.length,
        (index) => {
          IngredientGetter(nameOfIngredient: nameOfIngredient[index],
              quantity: quantity[index])
            });
    return listOfIngredient;
  }

  // ? add some ingredient button
  Widget addButton() {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.add),
          onPressed: () {},
          label: const Text(''),
        ));
  }

  // ? Title getter
  Widget getTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var list = createIngredientTextList();
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      color: const Color(0xff1d2822),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: getTitle()),
                  Column(
                    children: List.generate(list.length, (index) => (
                        getIngredient(index)
                    ))
                  ),
            ],
          ),
        ],
      ),
    );
  }
}



class IngredientGetter extends StatefulWidget {
  final dynamic nameOfIngredient;
  final dynamic quantity;
  const IngredientGetter(
      {
        Key? key,
        required this.nameOfIngredient,
        required this.quantity
      }
  ) : super(key: key);

  @override
  _IngredientGetter createState() => _IngredientGetter();
}

class _IngredientGetter extends State<IngredientGetter>{
  int defaultBtnColor = 0xff343633;
  int addButtonColor = 0xff343633;
  int minusButtonColor = 0xff499274;
  Widget get() {

    return ListTile(
      leading: null,
      title: RichText(
        text: TextSpan(
          children: [
            const WidgetSpan(
              child:  Icon(
                  Icons.check,
                  color: Color(0xff303430),
                  size: 28
              ),
            ),
            WidgetSpan(
              child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    widget.nameOfIngredient,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      color: Color(0xffe7cbed),
                      fontWeight: FontWeight.w500,
                      wordSpacing: 5,
                    ),
                  )),
            ),
            WidgetSpan(
              child: Container(
                padding: const EdgeInsets.only(right: 2),
                child: Text(
                  widget.quantity,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff7e8782),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Icon(Icons.add_rounded, color: Color(0xff343633), size: 18,)
      trailing: getAddButton(),
    );
  }
  var defaultBtnIcon = Icons.add_rounded;
  var addIcon = Icons.add_rounded;
  var minusIcon = Icons.remove;

  Widget getAddButton(){
    return GestureDetector(
      onTap: (){
        setState(() {
          if(defaultBtnColor == addButtonColor){
            defaultBtnColor = minusButtonColor;
            defaultBtnIcon = minusIcon;
          }
          else {
            defaultBtnColor = addButtonColor;
            defaultBtnIcon = addIcon;
          }
        });
      },
      child: Container(
        height: 30.0,
        width: 30.0,
        child:  Center(
          child:  Icon(
            defaultBtnIcon,
            color: Color(defaultBtnColor),
            size: 24,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(color:  Color(defaultBtnColor), width: 3,)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: get()
    );
  }

}

