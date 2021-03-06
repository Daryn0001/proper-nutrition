import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CookMethodCreator extends StatefulWidget {
  List<String> cookingSteps;
  CookMethodCreator({Key? key, required this.cookingSteps}) : super(key: key);

  @override
  _CookMethodCreator createState() => _CookMethodCreator();
}

class _CookMethodCreator extends State<CookMethodCreator> {
  int textColor = 0xff999d9c;
  String title = 'Дайындау әдісі';

  Widget getCookingStepText(index) {
    String counter = '${index + 1})',
    text = ' ${widget.cookingSteps[index]}';
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Text.rich(
              TextSpan(
                  children: [
                    TextSpan(
                      text: counter,
                        style: TextStyle(
                          color: Color(textColor),
                          fontWeight: FontWeight.w700,
                        )
                    ),
                    TextSpan(
                        text: text,
                    )
                  ]),
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(textColor),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1.3,
          color: Color(0xff1e2d28),
        )
      ],
    );
  }

  Widget getTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Text(title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black26,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: getTitle()),
          Column(
              children: List.generate(
                  widget.cookingSteps.length,
                  (index) => Align(
                        alignment: Alignment.centerLeft,
                        child: (getCookingStepText(index)),
                      ))),
        ],
      ),
    );
  }
}
