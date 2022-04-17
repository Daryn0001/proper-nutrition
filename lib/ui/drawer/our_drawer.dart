import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../pages/favourites/favourites.dart';
import '../pages/main_pages/category_page/category_page_for_drawer.dart';
import '../pages/shopping_list/shopping_list_page.dart';


class OurDrawer extends StatefulWidget {
  const OurDrawer({Key? key}) : super(key: key);

  @override
  _Drawer createState() => _Drawer();
}

class _Drawer extends State<OurDrawer> {
  @override
  Widget build(BuildContext context) {

    const backgroundColor = 0xffAEFEFF;

    return  Drawer(
      child: Material(
        color: const Color(backgroundColor),
        child: ListView(
          children: [
            buildMenuItem(
                icon: Icons.house,
              text: 'Басты бет',
              onClicked: () => selectedItem(context, 0)
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              icon: Icons.format_list_bulleted_outlined,
              text: 'Барлық рецепттер',
                onClicked: () => selectedItem(context, 1)
            ),
            buildMenuItem(
                icon: Icons.favorite_border,
                text: 'Таңдаулылар',
                onClicked: () => selectedItem(context, 2)
            ),
            buildMenuItem(
                icon: Icons.add_shopping_cart,
                  text: 'Сатып алу тізімі',
                onClicked: () => selectedItem(context, 3)
            ),
           /* buildMenuItem(
                icon: Icons.circle_notifications_outlined,
                text: 'Жаңа өнімдерге жазылу',
                onClicked: () => selectedItem(context, 4)
            ),*/
            const SizedBox(height: 20),
           /* buildMenuItem(
                icon: Icons.star,
                text: 'Бағалау',
                onClicked: () => selectedItem(context, 4)
            ),*/
            buildMenuItem(
                icon: Icons.share,
                text: 'Досыңызға айтыңыз',
                onClicked: () => selectedItem(context, 4)
            ),
           /* buildMenuItem(
                icon: Icons.copy_sharp,
                text: 'Құпиялылық саясаты \nПайдалану шарттары',
                onClicked: () => selectedItem(context, 4)
            ),*/

          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({required String text, required IconData icon, VoidCallback? onClicked,   }){
    const color = Color(0xff4FBDBA);
    const hoverColor = Colors.white70;
    //0xff333834
    const iconColor = Color(0xffffffff);
    const textColor = Color(0xffffffff);
    const borderColor = Color(0xff4FBDBA);

    return Container(
      decoration:  BoxDecoration(
        color: color,
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: borderColor,
        ),
      ),
      child: ListTile(
        hoverColor: hoverColor,
        textColor: textColor,
        leading: Text(text,
        style: const TextStyle(
          fontSize: 16,
        )),
        trailing: Icon(icon, color: iconColor),
        onTap: onClicked,
      ),
    );
  }

  void selectedItem(BuildContext context, index){
    Navigator.of(context).pop();

    switch(index){
      case 0:  break;
      case 1: Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CategoryPage4Drawer())
      ); break;
      case 2: Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const  FavouritesPage())
      ); break;
      case 3: Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const  ShoppingList())
      ); break;
      case 4: getShareButton(); break;
    }
  }

  // ? Share Button
  Future<void> getShareButton() async{
    String s =
        '✌️Дұрыс тамақтану программасы✌️\n'
        '     （づ￣3￣）づ╭❤️～'
        '\nБұл бағдарламаны жүктемейтін адам -Ешак!️️️';
    Share.share(s);
  }

}