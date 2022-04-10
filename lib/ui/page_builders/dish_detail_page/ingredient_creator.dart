import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IngredientCreator extends StatefulWidget {
  const IngredientCreator({
    Key? key,
  }) : super(key: key);

  // double width;
  // double height;
  @override
  _IngredientCreator createState() => _IngredientCreator();
}

class _IngredientCreator extends State<IngredientCreator> {
  int addButtonColor = 0xff343633;
  int minusButtonColor = 0xff499274;

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


  List<Set<ListTile>> createIngredientTextList() {
    List<String> nameOfIngredient = ingredients.keys.toList();
    List<String> quantity = ingredients.values.toList();
    var listOfIngredient = List.generate(
        nameOfIngredient.length,
        (index) => {
              ListTile(
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
                              nameOfIngredient[index],
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
                            quantity[index],
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
                trailing: GestureDetector(
                  onTap: (){
                    setState(() {
                      if(addButtonColor == 0xff343633){
                        addButtonColor = 0xff499274;
                      }
                      else {
                        addButtonColor = 0xff343633;
                      }
                    });
                  },
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    child:  Center(
                      child:  Icon(
                        Icons.add_rounded,
                        color: Color(addButtonColor),
                        size: 24,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        border: Border.all(color:  Color(addButtonColor), width: 3,)),
                  ),
                ),
              ),
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


/*
* ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: list[index].elementAt(0),
                    );
                  })
* */