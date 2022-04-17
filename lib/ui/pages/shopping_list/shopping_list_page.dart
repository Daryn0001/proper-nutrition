import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proper_nutrition_app/ui/pages/shopping_list/switch_button.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  var appBarBackColor = const Color(0xff35858B);
  final  _backgroundColor = Colors.white70;
  final _textColor = const Color(0xff969696);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackColor,
        title: const Text('Сатып алу тізімі',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      body: Container(
        color: _backgroundColor,
        child: Flex(
          direction: Axis.vertical,
          children: [
            getList(),
          ],
        ),
      ),
    );
  }



  Widget getList() {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('ingredients')
              .snapshots(includeMetadataChanges: true),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return  const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  var id = snapshot.data!.docs[index].id;
                  bool _switchValue = false;
                  var data = snapshot.data!.docs[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: ListTile(
                      leading: getText(
                        name: data.get('name'),
                        quantity: data.get('quantity'),
                      ),
                      trailing:  SwitchButton(value: _switchValue, id : id),
                    ),
                  );
                }
            );
          }

      ),
    );
  }

    Widget getText({name, quantity}) {
      String foodName = name;
      foodName = '${foodName[0].toUpperCase()}${foodName.substring(1).toLowerCase()}';
      return RichText(text:
       TextSpan(
         style:  const TextStyle(


         ),
        children: [
          WidgetSpan(
            child: Text(
              foodName,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                  color: _textColor,
              ),
            ),
          ),
          WidgetSpan(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                  '($quantity)',
                style:  TextStyle(
                  color: _textColor,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          ),
        ]
      ),

      );
    }


/*margin: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),*/
  }

