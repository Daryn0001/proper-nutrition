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
  String title = 'Ингредиенты';
  Map<String, String> ingredients = {
    'Яйцо': ' 2 шт.',
    'Помидор': ' 30 г.',
    'Перец сладки': ' 50 г.',
    'Оливковое масло': ' 5 г.',
    'Соль': ' по вкусу ',
  };

  // ? Ingredient
  List<Set<ListTile>> getIngredientText() {
    List<String> nameOfIngredient = ingredients.keys.toList();
    List<String> quantity = ingredients.values.toList();
    var listOfIngredient = List.generate(
        nameOfIngredient.length,
        (index) => {
              ListTile(
                leading: const Icon(Icons.check),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          WidgetSpan(
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                child: Text(
                                  nameOfIngredient[index],
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
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
                                  fontSize: 14,
                                  color: Color(0xff7e8782),
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Icon(Icons.add_rounded, color: Color(0xff343633), size: 18,)
                trailing: Container(
                  height: 30.0,
                  width: 30.0,
                  child: const Center(
                    child:  Icon(
                      Icons.add_rounded,
                      color: Color(0xff343633),
                      size: 24,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(color: const Color(0xff343633), width: 3,)),
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
    var list = getIngredientText();
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
              ListView.builder(
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
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
